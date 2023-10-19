import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zindl_hub/0_data/models/book.dart';
import 'package:zindl_hub/1_domain/repositories/book_repository.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit({required this.bookService}) : super(BooksInitial());

  BookRepository bookService;

  Future<void> onStartedAsync() async {
    emit(BooksLoading());
    try {
      var books = await loadBooksAsync();
      if (books.isNotEmpty) {
        emit(BooksLoaded(books));
      } else {
        books = [];
        emit(BooksLoading());
      }
    } catch (e) {
      emit(BooksCubitStateError());
    }
  }

  Future<List<Book>> loadBooksAsync() {
    return Future.value(bookService.books);
  }

  void booksErrorState() {
    emit(BooksCubitStateError());
  }
}
