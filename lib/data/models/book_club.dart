import 'package:bookbuzz/data/models/book.dart';
import 'package:bookbuzz/data/models/suggested_book.dart';
import 'package:bookbuzz/data/models/user.dart';

class BookClub {
  int id;

  String name;

  String description;

  Book currentBook;

  String coverImage;

  List<User> admins;

  List<User> participants;

  int membersTotal;

  List<List<SuggestedBook>> votations;

  BookClub(
      {required this.id,
      required this.name,
      required this.description,
      required this.currentBook,
      required this.coverImage,
      required this.admins,
      required this.participants,
      required this.membersTotal,
      required this.votations});

  factory BookClub.fromJson(Map<String, dynamic> json) {
    return BookClub(
      id: json['id'],
      name: json['name'],
      description: json['description'].toString(),
      currentBook: Book(
        id: '',
        title: '',
        author: [],
        category: '',
        description: '',
        rating: 2,
        ratingCount: 3,
        pages: 4,
        coverImgUrl: '',
      ),
      coverImage: json['imageUrl'] ?? json['image_url'],
      admins: List.empty(),
      participants: List.empty(),
      membersTotal: json['members_total'],
      votations: [],
    );
  }

  factory BookClub.fromSingleJson(Map<String, dynamic> json) {
    return BookClub(
        id: json['id'],
        name: json['name'],
        description: json['description'].toString(),
        currentBook: Book(
            id: '',
            title: '',
            author: [],
            category: '',
            description: '',
            rating: 2,
            ratingCount: 3,
            pages: 4,
            coverImgUrl: ''),
        coverImage: json['image_url'],
        admins: List.empty(),
        participants: List.empty(),
        membersTotal: json['members_total'],
        votations: []);
  }
}
