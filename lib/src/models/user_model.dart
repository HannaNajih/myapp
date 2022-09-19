//import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uID;
  String? name;
  String? email;
  String? image;
  String? phone;

  DocumentReference? reference;

  UserModel({this.uID, this.name, this.email, this.image, this.phone});

  Map<String, dynamic> toMap() {
    return {
      "uID": uID,
      "name": name,
      "email": email,
      "image": image,
      "phone": phone,
    };
  }

  factory UserModel.fromSnapShot(DocumentSnapshot documentSnapshot) {
    return UserModel.fromMapp(
      documentSnapshot.data() as Map<String, dynamic>,
    );
  }
//bo garandnaway datayak ka image tedaya takw nacheta naw screeneki taza enja
//rasmaka pshan bat
  factory UserModel.fromMapp(Map<String, dynamic> map,
      {DocumentReference<Object?>? reference}) {
    return UserModel(
      uID: map['uID'],
      name: map['name'],
      email: map['email'],
      image: map['image'],
      phone: map['phone'],
    );
  }
}
