import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/getSongNews.dart';
import 'package:spotify/presentation/bloc/new_songs_state.dart';

import '../../service_locator.dart';

class NewSongsCubit extends Cubit<NewSongsState> {
  NewSongsCubit() : super(NewSongLoading());

  Future<void> getNewSongs() async {
    var returnedSongs = await sl<GetsongnewsUseCase>().call();
    returnedSongs.fold(
      (l) {
        emit(NewsSongsLoadFailure());
      },
      (data){
        emit(
          NewsSongsLoaded(songs: data)
        );
      }
    );
  }
}