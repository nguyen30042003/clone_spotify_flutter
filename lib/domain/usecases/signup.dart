import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/create_user_req.dart';
import 'package:spotify/utils/usecase/usecase.dart';

import '../../service_locator.dart';
import '../repository/authRepository.dart';

class SignupUseCase implements UseCase<Either, CreateUserReq>{
  @override
  Future<Either> call({CreateUserReq? params})  async {
    return sl<Authrepository>().signup(params!);
  }
  
}