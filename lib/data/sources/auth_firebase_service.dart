import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/create_user_req.dart';
import 'package:spotify/data/models/signin_user_req.dart';

abstract class AuthFirebaseService{
  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> signin(SigninUserReq signInUserReq);
  Future<Either> getUser();
}