import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/signin_user_req.dart';

import '../../data/models/create_user_req.dart';

abstract class Authrepository{

  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> signin(SigninUserReq signinUserReq);

  Future<Either> getUser();
}