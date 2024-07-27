import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/getUserFavoriteSongs.dart';
import 'package:spotify/presentation/bloc/favorite_songs_user_state.dart';

import '../../domain/entities/song.dart';
import '../../service_locator.dart';

class FavoriteSongsUserCubit extends Cubit<FavoriteSongsUserState>{
  FavoriteSongsUserCubit() : super(FavoriteSongsUserLoading());
  List<SongEntity> favoriteSongs = [];
  Future<void> getFavoriteSongUser() async{
    var songs = await sl<GetuserfavoritesongsUseCases>().call();
    songs.fold(
            (l) {
          emit(FavoriteSongsUserFailure());
        },
            (data){
              favoriteSongs = data  ;
          emit(
              FavoriteSongsUserLoaded(songs: favoriteSongs)
          );
        }
    );
  }
  void removeSong(int index) {
    favoriteSongs.removeAt(index);
    emit(
        FavoriteSongsUserLoaded(songs: favoriteSongs)
    );
  }

}