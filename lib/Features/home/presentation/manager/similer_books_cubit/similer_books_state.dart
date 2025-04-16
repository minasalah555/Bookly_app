part of 'similer_books_cubit.dart';

sealed class SimilerBooksCubitState extends Equatable {
  const SimilerBooksCubitState();

  @override
  List<Object> get props => [];
}

final class SimilerBooksCubitInitial extends SimilerBooksCubitState {}

final class SimilerBooksCubitLoading extends SimilerBooksCubitState {}

final class SimilerBooksCubitFailure extends SimilerBooksCubitState {
  final String errMessage;

  const SimilerBooksCubitFailure({required this.errMessage});
}

final class SimilerBooksCubitSuccess extends SimilerBooksCubitState {
  final List<BookModel> bookModel;

  const SimilerBooksCubitSuccess({required this.bookModel});
}
