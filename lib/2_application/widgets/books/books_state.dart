part of 'books_cubit.dart';

sealed class BooksState extends Equatable {}

final class BooksInitial extends BooksState {
  @override
  List<Object?> get props => ["InitialState"];
}

class BooksLoaded extends BooksState {
  final List<Book?> books;
  BooksLoaded(this.books);

  @override
  List<Object?> get props => ["LoadedState"];
}

final class BooksLoading extends BooksState {
  @override
  List<Object?> get props => ["LoadingState"];
}

final class BooksCubitStateError extends BooksState {
  @override
  List<Object?> get props => ["ErrorState"];
}
