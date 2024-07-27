import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/getPlayList.dart';
import 'package:spotify/presentation/bloc/play_list_state.dart';

import '../../service_locator.dart';

class PlayListCubit extends Cubit<PlayListState>{
  PlayListCubit() : super(PlayListLoading());
  Future<void> getPLayList() async {
    var returnedSongs = await sl<GetplaylistUseCase>().call();
    returnedSongs.fold(
            (l) {
          emit(PlayListLoadFailure());
        },
            (data){
          emit(
              PlayListLoaded(songs: data)
          );
        }
    );
  }

}