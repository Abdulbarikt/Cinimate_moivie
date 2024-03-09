class UserModel {
  String? id, firstname, lastname, email;
  UserModel({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
  });

  factory UserModel.fromMap(map) {
    return UserModel(
        email: map['email'],
        firstname: map['firstname'],
        lastname: map['lastname'],
        id: map.id);
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
    };
  }
}
