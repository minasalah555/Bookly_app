import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitial());
  final SearchRepo searchRepo;
  fetchBook({required String item}) async {
    emit(SearchBooksLoading());
    var result = await searchRepo.fetchBooks(item: item);
    result.fold(
      (failure) {
        emit(SearchBooksFailure(failure.errMessage));
      },
      (bookModel) {
        emit(SearchBooksSuccess(bookModel));
      },
    );
  }
}
