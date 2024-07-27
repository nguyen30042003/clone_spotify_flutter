import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:spotify/data/models/user.dart';
import 'package:spotify/data/sources/auth_firebase_service.dart';
import 'package:spotify/domain/entities/user.dart';

import '../models/create_user_req.dart';
import '../models/signin_user_req.dart';

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserReq signInUserReq) async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signInUserReq.email, password: signInUserReq.password);

      return const Right('Sign up successfully');
    } on FirebaseAuthException catch(e){
      String message ='';
      if(e.code == 'invalid-email') {
        message = 'Not user found for that email';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for that user';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async{
    try{
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);
      FirebaseFirestore.instance.collection('Users').doc(data.user?.uid)
        .set(
        {
          'name': createUserReq.fullName,
          'email': data.user?.email
        }
      );

      return const Right('Sign up successfully');
    } on FirebaseAuthException catch(e){
      String message ='';
      if(e.code == 'weak-passwok'){
        message = 'The password provided is too weak';
      }
      else if(e.code == 'email already in use'){
        message = 'An account already exists with that email';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> getUser() async{
    try{
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      var user = await firebaseFirestore.collection('Users').doc(
        firebaseAuth.currentUser?.uid
      ).get();

      UserModel userModel =UserModel.fromJson(user.data() !);
      userModel.imageURL = "https://cdn-icons-png.flaticon.com/512/10542/10542486.png";
      UserEntity userEntity = userModel.toEntity();
      return Right(userEntity);
    }catch(e){
      return const Left('An error ocurred');
    }
  }

}