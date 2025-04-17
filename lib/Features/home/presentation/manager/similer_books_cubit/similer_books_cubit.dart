import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'similer_books_state.dart';

class SimilerBooksCubit extends Cubit<SimilerBooksCubitState> {
  SimilerBooksCubit(this.homeRepo) : super(SimilerBooksCubitInitial());
  final HomeRepo homeRepo;
  Future<void> fetchFeaturedBooks({required String category}) async {
    emit(SimilerBooksCubitLoading());
    var result = await homeRepo.fetchSimilerBooks(categry: category);
    result.fold(
      (failure) {
        emit(SimilerBooksCubitFailure(errMessage: failure.errMessage));
      },
      (books) {
        emit(SimilerBooksCubitSuccess(bookModel: books));
      },
    );
  }
}
