import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/app_bar_basic.dart';
import 'package:spotify/common/widgets/favorite_button.dart';
import 'package:spotify/domain/entities/song.dart';
import 'package:spotify/presentation/bloc/play_song_cubitt.dart';
import 'package:spotify/presentation/bloc/play_song_state.dart';
import 'package:spotify/utils/configs/theme/app_colors.dart';

import '../../utils/configs/assets/app_vectors_and_images.dart';
import '../bloc/play_list_cubit.dart';
import '../bloc/play_list_state.dart';

class PlaySong extends StatelessWidget {
  const PlaySong({super.key, required this.songEntity, this.index = 1});
  final SongEntity songEntity;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBasic(
        hidden: true,
        title: SvgPicture.asset(
          AppVectorsAndImages.getLinkVector('spotify_logo'),
          height: 40,
          width: 40,
        ),
      ),
      body: BlocProvider(
        create: (_) => PlaySongCubit()..loadSong(
            AppVectorsAndImages.getMusicFirebase(songEntity.title)
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0, top: 15.0, left: 15.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            AppVectorsAndImages.getLinkImageFirebase(songEntity.title),
                          )
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 5, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              songEntity.title,
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Text(
                          songEntity.artist,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                    FavoriteButton(
                        songEntity: songEntity
                    )

                  ],
                ),
              ),
              const SizedBox(height: 10,),
              _playState(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _playState(BuildContext context) {
    return BlocBuilder<PlaySongCubit,PlaySongState>(
      builder: (context, state){
        if(state is PlaySongLoading){
          return const CircularProgressIndicator();
        }
        if(state is PlaySongLoaded) {
            return Column(
              children: [
                Slider(
                    value: context.read<PlaySongCubit>().songPosition.inSeconds.toDouble(),
                    min: 0.0,
                    max: context.read<PlaySongCubit>().songDuration.inSeconds.toDouble() ,
                    onChanged: (value){}
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        formatDuration(
                            context.read<PlaySongCubit>().songPosition
                        )
                    ),

                    Text(
                        formatDuration(
                            context.read<PlaySongCubit>().songDuration
                        )
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                const SizedBox(height: 20,),
                BlocProvider(
                  create: (_) => PlayListCubit()..getPLayList(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<PlayListCubit, PlayListState>(
                        builder: (context, state) {
                          if (state is PlayListLoading) {
                            return Container(
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(),
                            );
                          }
                          if (state is PlayListLoaded) {
                            if (index == 0) {
                              return Container();
                            }
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => PlaySong(
                                      songEntity: state.songs[index - 1],
                                      index: index - 1,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.darkGrey,
                                ),
                                child: const Icon(
                                  Icons.skip_previous,
                                ),
                              ),
                            );
                          }
                          if (state is PlayListLoadFailure) {
                            return const Text('Error load play song');
                          }
                          return Container();
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<PlaySongCubit>().playOrPauseSong();
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary,
                          ),
                          child: Icon(
                            context.read<PlaySongCubit>().audioPlayer.playing
                                ? Icons.pause
                                : Icons.play_arrow,
                          ),
                        ),
                      ),
                      BlocBuilder<PlayListCubit, PlayListState>(
                        builder: (context, state) {
                          if (state is PlayListLoading) {
                            return Container(
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(),
                            );
                          }
                          if (state is PlayListLoaded) {
                            if (state.songs.length == index + 1) {
                              return Container();
                            }
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => PlaySong(
                                      songEntity: state.songs[index + 1],
                                      index: index + 1,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.darkGrey,
                                ),
                                child: const Icon(
                                  Icons.skip_next,
                                ),
                              ),
                            );
                          }
                          if (state is PlayListLoadFailure) {
                            return const Text('Error load play song');
                          }
                          return Container();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        if (state is PlaySongLoadFailure) {
          return const Text('Error load play song');
        }
        return Container();
      }
    );
  }
  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2,'0')}:${seconds.toString().padLeft(2,'0')}';
  }
}
