import 'package:zindl_hub/0_data/models/book.dart';

class BookRepository {
  List<Book> books = [
    const Book(
        "12 Rules of Life",
        "https://static.displate.com/857x1200/displate/2022-02-23/7890bf8752c3854b3719c24edcdb1237_6c52f6f22d4fa65b4cc28963e128791f.jpg",
        "Order your life")
  ];

  Future<List<Book>?> loadAllBooksAsync() {
    return Future(() => books);
  }
}
