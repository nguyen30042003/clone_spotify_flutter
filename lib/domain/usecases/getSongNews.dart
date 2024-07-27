import 'package:dartz/dartz.dart';
import 'package:spotify/data/repository/song_repository_impl.dart';
import 'package:spotify/domain/repository/songRepository.dart';

import '../../service_locator.dart';
import '../../utils/usecase/usecase.dart';

class GetsongnewsUseCase implements UseCase<Either, dynamic > {
  @override
  Future<Either> call({params}) async{
    return await sl<Songrepository>().getNewsSongs();
  }

}