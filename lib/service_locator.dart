
import 'package:get_it/get_it.dart';
import 'package:spotify/data/repository/auth_repository_impl.dart';
import 'package:spotify/data/repository/song_repository_impl.dart';
import 'package:spotify/data/sources/auth_firebase_service.dart';
import 'package:spotify/data/sources/auth_firebase_service_impl.dart';
import 'package:spotify/data/sources/song_firebase_service.dart';
import 'package:spotify/data/sources/song_firebase_service_impl.dart';
import 'package:spotify/domain/repository/songRepository.dart';
import 'package:spotify/domain/usecases/addOrRemoveFavoriteSong.dart';
import 'package:spotify/domain/usecases/getPlayList.dart';
import 'package:spotify/domain/usecases/getSongNews.dart';
import 'package:spotify/domain/usecases/getUser.dart';
import 'package:spotify/domain/usecases/getUserFavoriteSongs.dart';
import 'package:spotify/domain/usecases/isFavoriteSong.dart';
import 'package:spotify/domain/usecases/signin.dart';

import 'domain/repository/authRepository.dart';
import 'domain/usecases/signup.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
  );

  sl.registerSingleton<Authrepository>(
      AuthRepositoryImpl()
  );

  sl.registerSingleton<SongFirebaseService>(
      SongFirebaseServiceImpl()
  );
  sl.registerSingleton<Songrepository>(
      SongRepositoryImpl()
  );


  sl.registerSingleton<SignupUseCase>(
      SignupUseCase()
  );

  sl.registerSingleton<SigninUsecase>(
      SigninUsecase()
  );
  sl.registerSingleton<GetsongnewsUseCase>(
      GetsongnewsUseCase()
  );
  sl.registerSingleton<GetplaylistUseCase>(
      GetplaylistUseCase()
  );
  sl.registerSingleton<AddorremovefavoritesongUseCases>(
      AddorremovefavoritesongUseCases()
  );
  sl.registerSingleton<IsfavoritesongUseCases>(
      IsfavoritesongUseCases()
  );

  sl.registerSingleton<GetuserUseCases>(
    GetuserUseCases()
  );

  sl.registerSingleton<GetuserfavoritesongsUseCases>(
    GetuserfavoritesongsUseCases()
  );
}
