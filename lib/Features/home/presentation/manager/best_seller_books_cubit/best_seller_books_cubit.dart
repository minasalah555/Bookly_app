import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'best_seller_books_state.dart';

class BestSellerBooksCubit extends Cubit<BestSellerBooksState> {
  BestSellerBooksCubit(this.homeRepo) : super(BestSellerBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchNewsetBooks() async {
    emit(BestSellerBooksLoading());
    var result = await homeRepo.fetchNewsetBooks();
    result.fold(
      (failure) {
        emit(BestSellerBooksFailure(failure.errMessage));
      },
      (books) {
        emit(BestSellerBooksSuccess(books));
      },
    );
  }
}
