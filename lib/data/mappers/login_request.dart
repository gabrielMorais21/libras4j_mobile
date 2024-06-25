class LoginRequest {
  final String email;
  final String password;
  final String grantType;

  LoginRequest(
      {required this.email, required this.password, required this.grantType});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'grant_type': grantType,
    };
  }
}
