class BookStatus {
  int id;

  String description;

  BookStatus({
    required this.id,
    required this.description,
  });

  factory BookStatus.fromJson(Map<String, dynamic> element) {
    return BookStatus(
      id: element['id'],
      description: element['description'],
    );
  }
}
