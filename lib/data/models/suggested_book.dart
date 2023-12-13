import 'package:bookbuzz/data/models/book.dart';
import 'package:bookbuzz/data/models/user.dart';

class SuggestedBook extends Book {
  List<User> votes;
  User suggestedBy;

  SuggestedBook(
      String category,
      String title,
      List<String> author,
      String description,
      double rating,
      int ratingCount,
      int pages,
      String coverImg,
      this.votes,
      this.suggestedBy)
      : super(
          id: '',
          title: title,
          author: author,
          category: category,
          description: description,
          rating: rating,
          ratingCount: ratingCount,
          pages: pages,
          coverImgUrl: coverImg,
        );
}
