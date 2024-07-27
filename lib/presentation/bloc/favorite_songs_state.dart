abstract class FavoriteSongsState {}

class FavoriteInitial extends FavoriteSongsState {}

class FavoriteUpdated extends FavoriteSongsState{
  final bool isFavorite;
  FavoriteUpdated({required this.isFavorite});
}