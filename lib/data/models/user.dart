import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/domain/entities/user.dart';

import '../../domain/entities/song.dart';

class UserModel {
  String ? fullName;
  String ? email;
  String ? imageURL;

  UserModel({
    required this.fullName,
    required this.email,
    required this.imageURL
  });

  UserModel.fromJson(Map<String,dynamic> data) {
    fullName = data['name'];
    email = data['email'];
  }
}

extension UserModelX on UserModel {

  UserEntity toEntity() {
    return UserEntity(
        email: email,
        fullName: fullName,
        imageURL: imageURL
    );
  }
}