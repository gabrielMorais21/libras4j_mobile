class CreateAccountRequest {
  final String name;
  final String email;
  final String password;
  final List<Roles> roles;

  CreateAccountRequest(
      {required this.name,
      required this.email,
      required this.password,
      required this.roles});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['roles'] = roles.map((v) => v.toJson()).toList();

    return data;
  }
}

class Roles {
  final int id;
  final String roleName;

  Roles({required this.id, required this.roleName});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['roleName'] = roleName;
    return data;
  }
}
