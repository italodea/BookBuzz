import 'package:bookbuzz/data/models/user_book_situation.dart';

class User {
  int id;
  String name;
  String urlPhoto;
  String email;

  List<UserBookSituation> wishBooks = [];
  List<UserBookSituation> readingBooks = [];
  List<UserBookSituation> readBooks = [];
  List<UserBookSituation> droppedBooks = [];

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.urlPhoto,
  });

  factory User.fromJson(Map<String, dynamic> element) {
    var urlPhoto = element.containsKey('url_photo')
        ? element['url_photo']
        : element['urlPhoto'] ?? '';
    var uri = Uri.tryParse(urlPhoto);

    if (uri == null ||
        !(uri.isScheme('http') || uri.isScheme('https') && uri.hasAuthority)) {
      urlPhoto =
          'https://www.jornaljoca.com.br/wp-content/uploads/2019/11/joca_leitor2.png';
    }

    return User(
      id: element['id'],
      name: element['name'],
      urlPhoto: urlPhoto,
      email: element['email'],
    );
  }

  factory User.toJson(User user) {
    return User(
      id: user.id,
      name: user.name,
      urlPhoto: user.urlPhoto,
      email: user.email,
    );
  }

  String toJson() {
    return '{'
        '"id": $id,'
        '"name": "$name",'
        '"url_photo": "$urlPhoto",'
        '"email": "$email"'
        '}';
  }
}
