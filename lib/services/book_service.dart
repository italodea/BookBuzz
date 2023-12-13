import 'package:bookbuzz/data/models/book.dart';
import 'package:bookbuzz/data/repositories/google_books_api.dart';

class BookService {
  BookService();

  Future<Book?> getBookById(String id) async {
    try {
      return await GoogleBooksApi.getBookById(id);
    } catch (e) {
      return null;
    }
  }
}
