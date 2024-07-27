import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/create_user_req.dart';
import 'package:spotify/utils/usecase/usecase.dart';

import '../../data/models/signin_user_req.dart';
import '../../service_locator.dart';
import '../repository/authRepository.dart';

class SigninUsecase implements UseCase<Either, SigninUserReq >{
  @override
  Future<Either> call({SigninUserReq ? params})  async {
    return sl<Authrepository>().signin(params!);
  }

}