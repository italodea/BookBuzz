import 'package:bookbuzz/data/models/user.dart';
import 'package:bookbuzz/static_db/users_list.dart';

class ClubsList {
  // static List<Book> books_list = BooksList.list;
  static List<User> usersList = UsersList.list;

  // static List list = [
  //   BookClub(
  //     id: 1,
  //     name: 'Clube do Livro',
  //     currentBook: books_list[0],
  //     coverImage:
  //         'https://i.pinimg.com/originals/0f/6e/6a/0f6e6a3b6b0b6b0b6b0b6b0b6b0b6b0b.jpg',
  //     admins: [users_list[0]],
  //     participants: [
  //       users_list[0],
  //       users_list[1],
  //       users_list[2],
  //       users_list[3],
  //       users_list[4],
  //       users_list[5],
  //       users_list[6],
  //       users_list[7],
  //       users_list[8],
  //       users_list[9],
  //     ],
  //     votations: [SuggestedBookList.list],
  //   ),
  //   BookClub(
  //     id: 2,
  //     name: 'Clube do Livro 2',
  //     currentBook: books_list[1],
  //     coverImage: 'https://wallpapersafari.com/image/library-wallpaper.jpg',
  //     admins: [users_list[7]],
  //     participants: [
  //       users_list[0],
  //       users_list[1],
  //       users_list[2],
  //       users_list[3],
  //       users_list[4],
  //       users_list[5],
  //       users_list[6],
  //       users_list[7],
  //       users_list[8],
  //       users_list[9],
  //     ],
  //     votations: [SuggestedBookList.list],
  //   ),
  //   BookClub(
  //     id: 3,
  //     name: 'Clube do Livro 3',
  //     currentBook: books_list[2],
  //     coverImage:
  //         'https://i.pinimg.com/originals/0f/6e/6a/0f6e6a3b6b0b6b0b6b0b6b0b6b0b6b0b.jpg',
  //     admins: [users_list[0]],
  //     participants: [
  //       users_list[0],
  //       users_list[1],
  //     ],
  //     votations: [SuggestedBookList.list],
  //   ),
  // ];

  // static List getClubsWhereImMember(User user) {
  //   List filteredList = list.where((elemento) {
  //     return elemento.admins.contains(user);
  //   }).toList();

  //   return filteredList;
  // }

  // static List getClubsWhereImNotMember(User user) {
  //   List lifilteredListst = list.where((elemento) {
  //     return !elemento.admins.contains(user);
  //   }).toList();

  //   return lifilteredListst;
  // }
}
