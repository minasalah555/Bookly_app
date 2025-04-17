import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  @override
  ApiServices apiServices;
  SearchRepoImpl(this.apiServices);
  Future<Either<Failure, List<BookModel>>> fetchBooks({
    required String item,
  }) async {
    try {
      var data = await apiServices.get(endPoint: 'volumes?q=$item');
      List<BookModel> books = [];
      for (var element in data['items']) {
        books.add(BookModel.fromJson(element));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
