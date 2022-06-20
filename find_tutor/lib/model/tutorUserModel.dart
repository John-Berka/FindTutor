class tutorUserModel {
  String? tid;
  String? email;
  String? firstName;
  String? lastName;

  tutorUserModel({this.tid, this.email, this.firstName, this.lastName});

  //receiving from server
  factory tutorUserModel.fromMap(map) {
    return tutorUserModel(
        tid: map['tid'],
        email: map['email'],
        firstName: map['firstName'],
        lastName: map['lastName']);
  }

  //sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'tid': tid,
      'email': email,
      'firtsName': firstName,
      'lastName': lastName
    };
  }
}
