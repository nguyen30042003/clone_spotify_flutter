import 'package:dartz/dartz.dart';
import 'package:spotify/utils/usecase/usecase.dart';

import '../../service_locator.dart';
import '../repository/songRepository.dart';

class GetplaylistUseCase implements UseCase<Either, dynamic>{
  @override
  Future<Either> call({params}) async {
    return await sl<Songrepository>().getPlayList();
  }

}