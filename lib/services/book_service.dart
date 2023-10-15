import 'package:zindl_hub/0_data/models/book.dart';

class BookService {
  List<Book> books = [
    const Book(
        "12 Rules of Life",
        "https://resocoder.com/wp-content/uploads/2019/11/001-chemical.svg",
        "Order your life")
  ];

  Future<List<Book>?> loadAllBooksAsync() {
    return Future(() => books);
  }
}
