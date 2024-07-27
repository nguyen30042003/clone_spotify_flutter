
import 'package:spotify/utils/usecase/usecase.dart';

import '../../service_locator.dart';
import '../repository/songRepository.dart';

class IsfavoritesongUseCases implements UseCase<bool, String>{
  @override
  Future<bool> call({String ? params}) async {
    return await sl<Songrepository>().isFavoriteSong(params!);
  }

}