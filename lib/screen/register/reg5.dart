import 'dart:io';

class UserModel {
  String email;
  String displayName;
  String? password;
  String phoneNumber;
  String? photoURL;
  String? uid;
  File? file;

  UserModel({required this.email, this.password,required this.phoneNumber, this.photoURL, required this.displayName, this.uid});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> result = {
      "email": email,
      "phoneNumber": phoneNumber,
      "displayName": displayName,
      "photoURL": photoURL,
      "uid": uid
    };
    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        email: map["email"],
        phoneNumber: map["phoneNumber"],
        photoURL: map["photoURL"],
        displayName: map["displayName"],
        uid: map["uid"]);
  }
}