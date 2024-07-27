import 'package:dartz/dartz.dart';
import 'package:spotify/domain/repository/authRepository.dart';
import 'package:spotify/domain/repository/songRepository.dart';
import 'package:spotify/utils/usecase/usecase.dart';

import '../../service_locator.dart';

class GetuserfavoritesongsUseCases implements UseCase<Either, dynamic > {
  @override
  Future<Either> call({params}) async{
    return await sl<Songrepository>().getUserFavoriteSongs();
  }

}