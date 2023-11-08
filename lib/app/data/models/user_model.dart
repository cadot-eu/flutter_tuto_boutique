class User {
  int? id;
  String? email;
  List<String>? roles;
  String? password;
  String? userIdentifier;

  User({this.id, this.email, this.roles, this.password, this.userIdentifier});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    roles = json['roles']?.cast<String>();
    password = json['password'];
    userIdentifier = json['userIdentifier'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['roles'] = roles;
    data['password'] = password;
    data['userIdentifier'] = userIdentifier;
    return data;
  }
}
