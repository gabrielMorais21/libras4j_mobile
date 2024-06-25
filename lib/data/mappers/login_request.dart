class LoginRequest {
  final String username;
  final String password;
  final String grantType;

  LoginRequest(
      {required this.username,
      required this.password,
      required this.grantType});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'grant_type': grantType,
    };
  }
}
