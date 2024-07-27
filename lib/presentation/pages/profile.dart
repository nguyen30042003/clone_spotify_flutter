import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/app_bar_basic.dart';
import 'package:spotify/presentation/bloc/favorite_songs_user_cubit.dart';
import 'package:spotify/presentation/bloc/favorite_songs_user_state.dart';
import 'package:spotify/presentation/bloc/profile_info_state.dart';
import 'package:spotify/presentation/pages/play_song.dart';

import '../../common/widgets/favorite_button.dart';
import '../../utils/configs/assets/app_vectors_and_images.dart';
import '../../utils/configs/theme/app_colors.dart';
import '../bloc/favorite_songs_cubit.dart';
import '../bloc/profile_info_cubit.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBasic(
        backgroundColor: const Color(0xff2C2B2B),
        title: SvgPicture.asset(
          AppVectorsAndImages.getLinkVector('spotify_logo'),
          height: 40,
          width: 40,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _profileInfor(context),
          const SizedBox(height: 15,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 5,
              ),
              child: _favoriteSongs(context),
            ),
          ),

        ],
      ),
    );
  }

  Widget _profileInfor(BuildContext context){
    return BlocProvider(
      create: (context) => ProfileInfoCubit()..getProfile(),
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.checkDarkMode ? const Color(0xff2C2B2B) : Colors.white,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50)
            )
        ),
        child: BlocBuilder<ProfileInfoCubit,ProfileInfoState>(
          builder: (context,state) {
            if(state is ProfileInfoLoading){
              return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              );
            }
            if(state is ProfileInfoLoaded){
              return Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 5.5,
                    width: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          state.userEntity.imageURL!
                        )
                      )
                    ),
                  ),

                  Text(
                    state.userEntity.email!
                  ),
                  const SizedBox(height: 15,),
                  Text(
                    state.userEntity.fullName!,
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              );
            }
            if(state is ProfileInfoFailure) {
              return const Text(
                  'Please try again'
              );
            }
            return Container();

          },

        ),
      ),
    );
  }

  Widget _favoriteSongs(BuildContext context){
    return BlocProvider(
      create: (context) => FavoriteSongsUserCubit()..getFavoriteSongUser(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'FAVORITE SONGS',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              BlocBuilder<FavoriteSongsUserCubit, FavoriteSongsUserState>(
                builder: (context, state) {
                  if (state is FavoriteSongsUserLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is FavoriteSongsUserLoaded) {
                    return ListView.separated(
                      shrinkWrap: true,  // Ensure ListView does not take infinite height
                      physics: const NeverScrollableScrollPhysics(),  // Disable scrolling inside the ListView
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => PlaySong(songEntity: state.songs[index]),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              AppVectorsAndImages.getLinkImageFirebase(state.songs[index].title),
                                            )
                                        )
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.songs[index].title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        state.songs[index].artist,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                      state.songs[index].duration.toString().replaceAll('.', ':'),
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(width: 10, ),
                                  FavoriteButton(
                                    songEntity: state.songs[index],
                                    key: UniqueKey(),
                                    function: (){
                                      context.read<FavoriteSongsUserCubit>().removeSong(index);
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(height: 20),
                      itemCount: state.songs.length,
                    );
                  }
                  if (state is FavoriteSongsUserFailure) {
                    return const Center(
                      child: Text('An error occurred'),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }



}
