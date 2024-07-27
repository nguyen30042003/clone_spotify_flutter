import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/presentation/bloc/new_songs_cubit.dart';
import 'package:spotify/presentation/pages/play_song.dart';
import 'package:spotify/utils/configs/theme/app_colors.dart';

import '../../domain/entities/song.dart';
import '../../utils/configs/assets/app_vectors_and_images.dart';
import '../bloc/new_songs_state.dart';

class NewSongs extends StatelessWidget {
  const NewSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => NewSongsCubit()..getNewSongs(),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height / 5,
        child: BlocBuilder<NewSongsCubit,NewSongsState>(
            builder: (context,state) {
              if (state is NewSongLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is NewsSongsLoaded) {
                return _songs(state.songs);
              }

              if (state is NewsSongsLoadFailure) {
                return const Center(
                  child: Text('Error:'),
                );
              }

              return const Center(
                child: Text('list play'),
              );
            }

        )
      ),
    );
  }
  Widget _songs(List<SongEntity> songs){
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => PlaySong(songEntity: songs[index])
                  )
              );
            },
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width/2.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                AppVectorsAndImages.getLinkImageFirebase(songs[index].title),
                            )
                          )
                        ),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 40,
                            width: 40,
                            transform: Matrix4.translationValues(10, 10, 0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: context.checkDarkMode ? AppColors.darkGrey : const Color(0xffE6E6E6)
                            ),
                            child: Icon(
                              Icons.play_arrow_rounded,
                              color: context.checkDarkMode ? const Color(0xff959595) : const Color(0xff555555),
                            ),
                          ),
                        ),
                      )
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    songs[index].title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                    ),
                  ),
                  const SizedBox(height: 3,),
                  Text(
                    songs[index].artist,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                    ),
                  ),

                ],
              ),
            ),
          );
        },
        separatorBuilder: (context,index) => const SizedBox(width: 14,),
        itemCount: songs.length
    );
  }
}
