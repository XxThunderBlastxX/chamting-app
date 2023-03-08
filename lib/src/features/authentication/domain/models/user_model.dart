class User {
  String? id;
  String? name;
  String? email;
  String? password;

  User({this.id, this.name, this.email, this.password});

  User.fromJson(Map<String, dynamic> json) {
    id = json['\$id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }

  User copyWith({String? id, String? name, String? email, String? password}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  String toString() =>
      'User(id: $id, name: $name, email: $email, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ email.hashCode ^ password.hashCode;
}
