import '../../domain/entities/song.dart';

abstract class NewSongsState{}

class NewSongLoading extends NewSongsState{}

class NewsSongsLoaded extends NewSongsState{
  final List<SongEntity> songs;
  NewsSongsLoaded({required this.songs});
}

class NewsSongsLoadFailure extends NewSongsState {}