import '../../domain/entities/song.dart';

abstract class FavoriteSongsUserState {}

class FavoriteSongsUserLoading extends FavoriteSongsUserState{}

class FavoriteSongsUserLoaded extends FavoriteSongsUserState{
  final List<SongEntity> songs;
  FavoriteSongsUserLoaded({required this.songs});
}

class FavoriteSongsUserFailure extends FavoriteSongsUserState{}