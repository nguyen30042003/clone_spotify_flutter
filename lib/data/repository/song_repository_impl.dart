import 'package:dartz/dartz.dart';
import 'package:spotify/data/sources/song_firebase_service_impl.dart';
import 'package:spotify/domain/repository/songRepository.dart';

import '../../service_locator.dart';
import '../sources/song_firebase_service.dart';

class SongRepositoryImpl extends Songrepository{
  @override
  Future<Either> getNewsSongs() async {
    return await sl<SongFirebaseService>().getSongsNew();
  }

  @override
  Future<Either> getPlayList() async {
    return await sl<SongFirebaseService>().getPlayList();
  }

  @override
  Future<Either> addOrRemoveFavoriteSongs(String songId) async {
    return await sl<SongFirebaseService>().addOrRemoveFavoriteSong(songId);
  }

  @override
  Future<Either> getUserFavoriteSongs() async {
    return await sl<SongFirebaseService>().getUserFavoriteSongs();
  }

  @override
  Future<bool> isFavoriteSong(String songId) async {
    return await sl<SongFirebaseService>().isFavoriteSong(songId);
  }

}