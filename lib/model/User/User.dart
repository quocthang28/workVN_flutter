import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel({required this.name, this.uid, required this.favorites});

  String name;
  String? uid;
  List<String> favorites;

  factory UserModel.fromMap(Map data) {
    return UserModel(
      name: data['name'],
      favorites: List.from(data['favorites']),
    );
  }

  Map<String, dynamic> toJSON() => {
        "name": name,
        "favorites": favorites,
      };
}
