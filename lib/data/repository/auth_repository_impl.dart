import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/signin_user_req.dart';
import 'package:spotify/data/sources/auth_firebase_service_impl.dart';
import 'package:spotify/domain/repository/authRepository.dart';

import '../../service_locator.dart';
import '../models/create_user_req.dart';
import '../sources/auth_firebase_service.dart';

class AuthRepositoryImpl extends Authrepository{
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    return await  sl<AuthFirebaseService>().signin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await  sl<AuthFirebaseService>().signup(createUserReq);
  }

  @override
  Future<Either> getUser() async {
    return await sl<AuthFirebaseService>().getUser();
  }

}