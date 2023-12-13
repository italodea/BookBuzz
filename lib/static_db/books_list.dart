// import 'package:bookbuzz/data/models/book.dart';

// class BooksList {
//   static List<Book> list = [
//     // Fantasia
//     Book(
//       id: '',
//       title: "O Senhor dos Anéis",
//       author: "J.R.R. Tolkien",
//       category: "Fantasia",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "Harry Potter e a Pedra Filosofal",
//       author: "J.K. Rowling",
//       category: "Fantasia",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/61jgm6ooXzL._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "O Hobbit",
//       author: "J.R.R. Tolkien",
//       category: "Fantasia",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl: "https://m.media-amazon.com/images/I/51S6-VeaHJL.jpg",
//     ),
//     Book(
//       id: '',
//       title: "As Crônicas de Nárnia",
//       author: "C.S. Lewis",
//       category: "Fantasia",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://harpercollins.com.br/cdn/shop/products/9786555114775_dad156bc-655e-4571-881e-6aa1b880233c.jpg?v=1692287590",
//     ),
//     Book(
//       id: '',
//       title: "Percy Jackson e o Ladrão de Raios",
//       author: "Rick Riordan",
//       category: "Fantasia",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/61JenSx3wKL._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "A Roda do Tempo",
//       author: "Robert Jordan",
//       category: "Fantasia",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://5934488p.ha.azioncdn.net/capas-livros/9788580573619-robert-jordan-o-olho-do-mundo-serie-a-roda-do-tempo-vol-1-62396352.jpg",
//     ),
//     Book(
//       id: '',
//       title: "A Bússola de Ouro",
//       author: "Philip Pullman",
//       category: "Fantasia",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/819DY12SBLL._AC_UF1000,1000_QL80_.jpg",
//     ),

//     // Romance
//     Book(
//       id: '',
//       title: "A Culpa é das Estrelas",
//       author: "John Green",
//       category: "Romance",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/51M9IbBqxCL._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "Orgulho e Preconceito",
//       author: "Jane Austen",
//       category: "Romance",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/71rMg3Nr73S._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "Romeu e Julieta",
//       author: "William Shakespeare",
//       category: "Romance",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://www.moderna.com.br/data/files/85/E4/35/E4/40705510A11C405528A808A8/romeuejulieta_walcyrcarrasco_gd.png",
//     ),
//     Book(
//       id: '',
//       title: "Amor nos Tempos do Cólera",
//       author: "Gabriel García Márquez",
//       category: "Romance",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/71GjyZVAYEL._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "Eleanor & Park",
//       author: "Rainbow Rowell",
//       category: "Romance",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/51-ki8g+Q0L._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "Um Dia",
//       author: "David Nicholls",
//       category: "Romance",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl: "https://m.media-amazon.com/images/I/41R1VJASBEL.jpg",
//     ),
//     Book(
//       id: '',
//       title: "Outlander",
//       author: "Diana Gabaldon",
//       category: "Romance",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/61DhpmIBqiL._AC_UF1000,1000_QL80_.jpg",
//     ),

//     // Mistério
//     Book(
//       id: '',
//       title: "O Código Da Vinci",
//       author: "Dan Brown",
//       category: "Mistério",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/710DjekSUkL._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "Sherlock Holmes: Uma Aventura",
//       author: "Arthur Conan Doyle",
//       category: "Mistério",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://harpercollins.com.br/cdn/shop/products/9788595085350_1aefd0ff-2186-4208-a4e2-4fd4e8c1a44a.jpg?v=1686056383",
//     ),
//     Book(
//       id: '',
//       title: "Garota Exemplar",
//       author: "Gillian Flynn",
//       category: "Mistério",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/510k5EkYuWL._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "Os Assassinatos da Rua Morgue",
//       author: "Edgar Allan Poe",
//       category: "Mistério",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/71Lx5p+10KL._AC_UF350,350_QL50_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "A Garota no Trem",
//       author: "Paula Hawkins",
//       category: "Mistério",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl: "https://m.media-amazon.com/images/I/51s6lglXdSL.jpg",
//     ),
//     Book(
//       id: '',
//       title: "Inferno",
//       author: "Dan Brown",
//       category: "Mistério",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl: "https://m.media-amazon.com/images/I/51wVwq2aDUL.jpg",
//     ),
//     Book(
//       id: '',
//       title: "O Nome da Rosa",
//       author: "Umberto Eco",
//       category: "Mistério",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/71NFvKQ4oZL._AC_UF1000,1000_QL80_.jpg",
//     ),

//     // Horror
//     Book(
//       id: '',
//       title: "O Iluminado",
//       author: "Stephen King",
//       category: "Horror",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 0,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 0,
//       pages: 111,
//       thumbImgUrl:
//           "https://images-na.ssl-images-amazon.com/images/I/91a-DeI68VL.jpg",
//     ),
//     Book(
//       id: '',
//       title: "Psicose",
//       author: "Robert Bloch",
//       category: "Horror",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 0,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 0,
//       pages: 111,
//       thumbImgUrl:
//           "https://a-static.mlcdn.com.br/450x450/livro-psicose-limited-edition/magazineluiza/224357400/ae3b5fcdf84b95d2312e48a5d389e1fb.jpg",
//     ),
//     Book(
//       id: '',
//       title: "O Exorcista",
//       author: "William Peter Blatty",
//       category: "Horror",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 0,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 0,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/91fQ51I4TRL._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "O Cemitério",
//       author: "Stephen King",
//       category: "Horror",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 0,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 0,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/8151ymQnnuL._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "Drácula",
//       author: "Bram Stoker",
//       category: "Horror",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 0,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 0,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/61MgodE1s0L._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "O Chamado de Cthulhu",
//       author: "H.P. Lovecraft",
//       category: "Horror",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 0,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 0,
//       pages: 111,
//       thumbImgUrl: "https://m.media-amazon.com/images/I/51VIb7Rbo5L.jpg",
//     ),
//     Book(
//       id: '',
//       title: "O Silêncio dos Inocentes",
//       author: "Thomas Harris",
//       category: "Horror",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 0,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 0,
//       pages: 111,
//       thumbImgUrl: "https://m.media-amazon.com/images/I/417aOo3qeGL.jpg",
//     ),

//     // Ficção
//     Book(
//       id: '',
//       title: "1984",
//       author: "George Orwell",
//       category: "Ficção",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 0,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/819js3EQwbL._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "Admirável Mundo Novo",
//       author: "Aldous Huxley",
//       category: "Ficção",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 0,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/61ey4N2stGL._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "Duna",
//       author: "Frank Herbert",
//       category: "Ficção",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 0,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/81zN7udGRUL._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "Neuromancer",
//       author: "William Gibson",
//       category: "Ficção",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 0,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/91Bx5ilP+EL._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "A Máquina do Tempo",
//       author: "H.G. Wells",
//       category: "Ficção",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 0,
//       pages: 111,
//       thumbImgUrl:
//           "https://www.lpm.com.br/livros/imagens/a_maquina_do_tempo_capa_9788525435354_hd.jpg",
//     ),
//     Book(
//       id: '',
//       title: "Fundação",
//       author: "Isaac Asimov",
//       category: "Ficção",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 0,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/81ZwYoGHefL._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "Jogador Nº1",
//       author: "Ernest Cline",
//       category: "Ficção",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 0,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/917GI-fesVL._AC_UF1000,1000_QL80_.jpg",
//     ),

//     // Drama
//     Book(
//       id: '',
//       title: "Os Miseráveis",
//       author: "Victor Hugo",
//       category: "Drama",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/61jbdjR38IL._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "A Lista de Schindler",
//       author: "Thomas Keneally",
//       category: "Drama",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/81PvO5Zf3yL._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "A Estrada",
//       author: "Cormac McCarthy",
//       category: "Drama",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl: "https://m.media-amazon.com/images/I/31jASWLH0EL.jpg",
//     ),
//     Book(
//       id: '',
//       title: "O Menino do Pijama Listrado",
//       author: "John Boyne",
//       category: "Drama",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/91YD+gCjjyL._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "A Vida de Pi",
//       author: "Yann Martel",
//       category: "Drama",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/519yYFawx+L._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "As Vinhas da Ira",
//       author: "John Steinbeck",
//       category: "Drama",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl: "https://m.media-amazon.com/images/I/51cLAItFadL.jpg",
//     ),
//     Book(
//       id: '',
//       title: "Precisamos Falar Sobre o Kevin",
//       author: "Lionel Shriver",
//       category: "Drama",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.5,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://cabanadoleitor.com.br/wp-content/uploads/2020/12/kevincapa.jpg.webp",
//     ),

//     // Comédia
//     Book(
//       id: '',
//       title: "O Guia do Mochileiro das Galáxias",
//       author: "Douglas Adams",
//       category: "Comédia",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 2.7,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/81eMrK+qVCL._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "Três Homens em um Barco",
//       author: "Jerome K. Jerome",
//       category: "Comédia",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 2.7,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/51LRTdHkM0L._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "Engraçadinha",
//       author: "Nelson Rodrigues",
//       category: "Comédia",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 2.7,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/81X6WLgM0tL._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "As Aventuras de Huckleberry Finn",
//       author: "Mark Twain",
//       category: "Comédia",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 2.7,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/91AW1FPXtEL._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "Morte à Crédito",
//       author: "Louis-Ferdinand Céline",
//       category: "Comédia",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 2.7,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/413j85jHTZL._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "O Apanhador no Campo de Centeio",
//       author: "J.D. Salinger",
//       category: "Comédia",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 2.7,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl: "https://m.media-amazon.com/images/I/5193mgpULoL.jpg",
//     ),
//     Book(
//       id: '',
//       title: "A Revolução dos Bichos",
//       author: "George Orwell",
//       category: "Comédia",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 2.7,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/91BsZhxCRjL._AC_UF1000,1000_QL80_.jpg",
//     ),

//     // Aventura
//     Book(
//       id: '',
//       title: "A Ilha do Tesouro",
//       author: "Robert Louis Stevenson",
//       category: "Aventura",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 2.4,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/81N-C60M53L._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "Vinte Mil Léguas Submarinas",
//       author: "Jules Verne",
//       category: "Aventura",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 2.4,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl: "https://m.media-amazon.com/images/I/51Bcp998vTL.jpg",
//     ),
//     Book(
//       id: '',
//       title: "O Último dos Moicanos",
//       author: "James Fenimore Cooper",
//       category: "Aventura",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 2.4,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl: "https://m.media-amazon.com/images/I/512irIOSyRL.jpg",
//     ),
//     Book(
//       id: '',
//       title: "A Odisséia",
//       author: "Homero",
//       category: "Aventura",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 2.4,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://cdn.kobo.com/book-images/c5a9e519-a7d3-4727-ad5d-2110aa6467df/1200/1200/False/a-odisseia-edicao-ilustrada.jpg",
//     ),
//     Book(
//       id: '',
//       title: "O Chamado Selvagem",
//       author: "Jack London",
//       category: "Aventura",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 2.4,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl: "https://m.media-amazon.com/images/I/51cSno0iGsL.jpg",
//     ),
//     Book(
//       id: '',
//       title: "Viagem ao Centro da Terra",
//       author: "Jules Verne",
//       category: "Aventura",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 2.4,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 999,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/A1s+6nCSdmL._AC_UF1000,1000_QL80_.jpg",
//     ),

//     // Ação
//     Book(
//       id: '',
//       title: "O Agente da U.N.C.L.E.",
//       author: "Robert Vaughn",
//       category: "Ação",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.2,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 457,
//       pages: 111,
//       thumbImgUrl:
//           "https://casadocolecionador.com.br/wp-content/uploads/2021/10/Clipboard01-99-scaled.jpg",
//     ),
//     Book(
//       id: '',
//       title: "Jurassic Park",
//       author: "Michael Crichton",
//       category: "Ação",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.2,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 457,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/61d8KnB-M1L._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "Bourne: O Supremacia",
//       author: "Robert Ludlum",
//       category: "Ação",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.2,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 457,
//       pages: 111,
//       thumbImgUrl:
//           "https://img.travessa.com.br/livro/BA/5c/5c4eef61-5668-4430-b12b-8ed466cc917e.jpg",
//     ),
//     Book(
//       id: '',
//       title: "O Colecionador de Ossos",
//       author: "Jeffery Deaver",
//       category: "Ação",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.2,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 457,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/81qQOWp81oL._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "O Caçador de Pipas",
//       author: "Khaled Hosseini",
//       category: "Ação",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.2,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 457,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/81yVzXTgLzL._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "A Identidade Bourne",
//       author: "Robert Ludlum",
//       category: "Ação",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.2,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 457,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/91wfReNJ-KL._AC_UF1000,1000_QL80_.jpg",
//     ),
//     Book(
//       id: '',
//       title: "O Símbolo Perdido",
//       author: "Dan Brown",
//       category: "Ação",
//       description:
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//       rating: 4.2,
//       coverImgUrl:
//           "https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg",
//       ratingCount: 457,
//       pages: 111,
//       thumbImgUrl:
//           "https://m.media-amazon.com/images/I/91vgurdy2LL._AC_UF1000,1000_QL80_.jpg",
//     ),
//   ];

//   static List<Book> searchBooks(
//       {String? category, String? title, String? author}) {
//     List<Book> results = [];

//     for (Book book in list) {
//       if ((category == null ||
//               book.category.toLowerCase() == category.toLowerCase()) &&
//           (title == null ||
//               book.title.toLowerCase().contains(title.toLowerCase())) &&
//           (author == null ||
//               book.author.toLowerCase().contains(author.toLowerCase()))) {
//         results.add(book);
//       }
//     }

//     return results;
//   }
// }
