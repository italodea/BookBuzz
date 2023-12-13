class Auth {
  String email;
  String token;

  Auth({required this.email, required this.token});

  factory Auth.fromJson(element) {
    return Auth(
      email: element['email'],
      token: element['token'],
    );
  }
}
