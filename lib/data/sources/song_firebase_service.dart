import 'package:dartz/dartz.dart';

abstract class SongFirebaseService{
  Future< Either> getSongsNew();
  Future< Either> getPlayList();
  Future<Either> addOrRemoveFavoriteSong(String songId);
  Future<bool> isFavoriteSong(String songId);
  Future<Either> getUserFavoriteSongs();
}