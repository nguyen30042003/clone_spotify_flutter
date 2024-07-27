import 'package:dartz/dartz.dart';
import 'package:spotify/utils/usecase/usecase.dart';

import '../../service_locator.dart';
import '../repository/songRepository.dart';

class AddorremovefavoritesongUseCases implements UseCase<Either, String>{
  @override
  Future<Either> call({String ? params}) async {
    return await sl<Songrepository>().addOrRemoveFavoriteSongs(params!);
  }

}