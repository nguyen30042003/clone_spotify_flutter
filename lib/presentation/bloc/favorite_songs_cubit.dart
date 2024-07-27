import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/addOrRemoveFavoriteSong.dart';
import 'package:spotify/presentation/bloc/favorite_songs_state.dart';

import '../../service_locator.dart';

class FavoriteSongsCubit extends Cubit<FavoriteSongsState>{
  FavoriteSongsCubit() : super(FavoriteInitial());

  Future<void> favoriteSongUpdated(String songId) async{
    var result = await sl<AddorremovefavoritesongUseCases>().call(
      params: songId
    );
    result.fold(
        (l){

        },
        (isFavorite){
          emit(
            FavoriteUpdated(isFavorite: isFavorite)
          );
        }
    );
  }
}