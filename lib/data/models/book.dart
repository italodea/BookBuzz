class Book {
  final String id;
  final String title;
  final List<dynamic> author;
  final String category;
  final String description;
  final double rating;
  final int ratingCount;
  final int pages;
  final String coverImgUrl;
  String thumbImgUrl = '';

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.description,
    required this.rating,
    required this.ratingCount,
    required this.pages,
    required this.coverImgUrl,
    String? thumbImgUrl,
  }) : thumbImgUrl =
            thumbImgUrl ?? coverImgUrl.replaceAll("&zoom=5", "&zoom=10");

  // factory Book.fromJson(Map<String, dynamic> json) {
  //   final authorsList = json['authors'] as List<dynamic>? ?? [];
  //   final authors = authorsList.isNotEmpty ? authorsList[0].toString() : '';

  //   final categoriesList = json['categories'] as List<dynamic>? ?? [];
  //   final categories =
  //       categoriesList.isNotEmpty ? categoriesList[0].toString() : '';

  //   final imageLinks = json['imageLinks'] as Map<String, dynamic>? ?? {};
  //   final thumbnail = imageLinks['smallThumbnail'] ?? '';

  //   return Book(
  //     id: 'jj',
  //     title: json['title'] ?? '',
  //     author: authors,
  //     category: categories,
  //     description: json['description'] ?? '',
  //     pages: json['pageCount'] ?? 0,
  //     rating: 4.5,
  //     ratingCount: 100,
  //     coverImgUrl: thumbnail.replaceAll("&edge=curl", ""),
  //   );
  // }

  factory Book.fromJson(Map<String, dynamic> json) {
    // List<dynamic> authors = json['volumeInfo']['authors'] ?? [];
    // List<String> authorsString = authors.map((e) => e.toString()).toList();

    if (!json['volumeInfo'].containsKey("imageLinks")) {
      json['volumeInfo']['imageLinks'] = {
        "smallThumbnail":
            "https://raw.githubusercontent.com/italodea/BookBuzz/master/assets/images/placeholder.png",
        "thumbnail":
            "https://raw.githubusercontent.com/italodea/BookBuzz/master/assets/images/placeholder.png"
      };
    }

    if (!json['volumeInfo'].containsKey("categories")) {
      json['volumeInfo']['categories'] = ["Sem categoria"];
    }

    if (!json['volumeInfo'].containsKey("authors")) {
      json['volumeInfo']['authors'] = ["Autor desconhecido"];
    }

    return Book(
      id: json['id'],
      title: json['volumeInfo']['title'] ?? '',
      author: json['volumeInfo']['authors'] ?? [],
      category: json['volumeInfo']['categories'][0],
      description: json['volumeInfo']['description'] ?? '',
      pages: json['volumeInfo']['pageCount'] ?? 0,
      rating: 4.5,
      ratingCount: 100,
      coverImgUrl: json['volumeInfo']['imageLinks'] != null
          ? json['volumeInfo']['imageLinks']['smallThumbnail'].replaceAll("&edge=curl", "")
          : json['volumeInfo']['imageLinks']['thumbnail'].replaceAll("&edge=curl", ""),
    );
  }
}
