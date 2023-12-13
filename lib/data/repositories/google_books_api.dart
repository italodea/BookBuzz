import 'dart:convert';

import 'package:bookbuzz/data/models/book.dart';
import 'package:bookbuzz/data/repositories/api.dart';
import 'package:http/http.dart' as http;

class GoogleBooksApi {
  static Future<List<Book>> findAll({
    String title = '',
    String genre = '',
    String author = '',
  }) async {
    final genreQuery = genre.isEmpty ? '' : '&q=subject:$genre';
    final titleQuery = title.isEmpty ? '' : '&q=intitle:$title';
    final url = Uri.parse(
        'https://www.googleapis.com/books/v1/volumes?fields=kind, totalItems, items(id, volumeInfo(title, authors, publishedDate, description, pageCount, categories, language, imageLinks(smallThumbnail)))$titleQuery$genreQuery&maxResults=40&printType=books&langRestrict=pt');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final items = jsonResponse['items'] as List<dynamic>;

      return items
          .map((book) => Book.fromJson(book))
          .where((newBook) =>
              newBook.coverImgUrl.contains('file://') == false &&
              newBook.coverImgUrl.isNotEmpty == true)
          .toList();
    } else {
      print("google_boks_api: findAll -> ${response.reasonPhrase}");
      return [];
    }
  }

  static Future<Book?> getBookById(String id) async {
    if (id == "") {
      return null;
    }
    final request = http.Request(
      'GET',
      Uri.parse('${MyAPI.BASE_GOOGLE_BOOKS_URL}/volumes/$id'),
    );

    final response = await request.send();

    if (response.statusCode == 200) {
      final json = await response.stream.bytesToString();
      return Book.fromJson(jsonDecode(json));
    } else {
      print("google_book_api: getBookById -> ${response.reasonPhrase}");
      return null;
    }
  }
}
