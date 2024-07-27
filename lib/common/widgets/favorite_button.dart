import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/entities/song.dart';
import 'package:spotify/presentation/bloc/favorite_songs_cubit.dart';
import 'package:spotify/utils/configs/theme/app_colors.dart';

import '../../presentation/bloc/favorite_songs_state.dart';

class FavoriteButton extends StatelessWidget {
  final SongEntity songEntity;
  final Function ? function;
  const FavoriteButton({
    required this.songEntity,
    this.function,
    super.key
});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteSongsCubit(),
      child: BlocBuilder<FavoriteSongsCubit, FavoriteSongsState>(
        builder: (BuildContext context, state) {
          if(state is FavoriteInitial){
            return IconButton(
                onPressed: () async {
                  await context.read<FavoriteSongsCubit>().favoriteSongUpdated(
                      songEntity.songId
                  );
                  if (function != null) {
                    function!();
                  }
                },
                icon: Icon(
                  songEntity.isFavorite ? Icons.favorite : Icons.favorite_outline_outlined,
                  size: 25,
                  color: AppColors.darkGrey,
                )
            );
          }
          if(state is FavoriteUpdated) {
            return IconButton(
                onPressed: () {
                  context.read<FavoriteSongsCubit>().favoriteSongUpdated(
                      songEntity.songId
                  );
                },
                icon: Icon(
                  state.isFavorite ? Icons.favorite : Icons.favorite_outline_outlined,
                  size: 25,
                  color: AppColors.darkGrey,
                )
            );
          }

          return Container();
        },
      )
    );
  }
}
