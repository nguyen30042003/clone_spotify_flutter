import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/presentation/bloc/play_list_cubit.dart';
import 'package:spotify/presentation/pages/play_song.dart';

import '../../common/widgets/favorite_button.dart';
import '../../domain/entities/song.dart';
import '../../utils/configs/theme/app_colors.dart';
import '../bloc/play_list_state.dart';

class GetPlayList extends StatelessWidget {
  const GetPlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlayListCubit()..getPLayList(),
      child: BlocBuilder<PlayListCubit, PlayListState>(
        builder: (context, state) {
          if (state is PlayListLoading) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }
          if (state is PlayListLoadFailure) {
            return Container(
              alignment: Alignment.center,
              child: const Text('Error'),
            );
          } else if (state is PlayListLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 16,
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Playlist',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'See More',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xffC6C6C6),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3, // You can adjust the height as needed
                    child: _listSong(state.songs),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: Text('list play'),
          );
        },
      ),
    );
  }
}

Widget _listSong(List<SongEntity> songs) {
  return ListView.separated(
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => PlaySong(songEntity: songs[index], index: index,)
            )
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.checkDarkMode ? AppColors.darkGrey : const Color(0xffE6E6E6)
                  ),
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: context.checkDarkMode ? const Color(0xff959595) : const Color(0xff555555) ,
                  ),
                ),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      songs[index].title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      songs[index].artist,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 11
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Row(
              children: [
                Text(
                    songs[index].duration.toString().replaceAll('.', ':') + 'min'
                ),
                const SizedBox(width: 10,),
                FavoriteButton(songEntity: songs[index])

              ],
            )

          ],
        ),
      );
    },
    separatorBuilder: (context, index) => const SizedBox(height: 20),
    itemCount: songs.length,
  );
}
