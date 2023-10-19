import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:zindl_hub/0_data/models/book.dart';
import 'package:zindl_hub/1_domain/repositories/book_repository.dart';
import 'package:zindl_hub/1_domain/repositories/weather_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:zindl_hub/2_application/widgets/books/books_cubit.dart';

///
///
/// https://resocoder.com/2019/11/29/bloc-test-tutorial-easier-way-to-test-blocs-in-dart-flutter/
///

class MocWeatherService extends Mock implements WeatherRepository {}

class MockBookService extends MockCubit<Book> implements BookRepository {}

late MockBookService mockBookService;
void main() {
  setUp(() => () {
        mockBookService = MockBookService();
      });

  // ignore: unused_local_variable
  List<Book> books = [
    const Book(
        "12 Rules of Life",
        "https://resocoder.com/wp-content/uploads/2019/11/001-chemical.svg",
        "Order your life")
  ];

  group("Book cubit", () {
    setUp(() => () {
          mockBookService = MockBookService();
        });
    blocTest<BooksCubit, BooksState>('Initial book state',
        build: () => BooksCubit(bookService: MockBookService()),
        expect: () => <BooksState>[]);

    blocTest<BooksCubit, BooksState>('Loading books',
        build: () => BooksCubit(bookService: MockBookService()),
        wait: const Duration(seconds: 4),
        act: (cubit) => cubit.onStartedAsync(),
        expect: () => <BooksState>[BooksLoading()]);

    blocTest<BooksCubit, BooksState>('Not empty books',
        build: () => BooksCubit(bookService: MockBookService()),
        wait: const Duration(seconds: 4),
        act: (cubit) => cubit.onStartedAsync(),
        expect: () =>
            <BooksState>[BooksLoading(), BooksLoaded(MockBookService().books)]);
  });
}
