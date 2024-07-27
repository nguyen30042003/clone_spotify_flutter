import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify/presentation/bloc/play_song_state.dart';

class PlaySongCubit extends Cubit<PlaySongState>{

  AudioPlayer audioPlayer = AudioPlayer();
  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;


  PlaySongCubit() : super(PlaySongLoading()){
    audioPlayer.positionStream.listen((position){
      songPosition = position;
      updateSongPlayer();
    });
    audioPlayer.durationStream.listen((duration) {
      songDuration = duration!;
    });

  }


  void updateSongPlayer() {
    emit(
        PlaySongLoaded()
    );
  }

  Future<void> loadSong(String url) async {
    try{
      await audioPlayer.setUrl(url);
      emit(
        PlaySongLoaded()
      );
    } catch(e){
      emit(
        PlaySongLoadFailure()
      );
    }
  }

  void playOrPauseSong(){
    if(audioPlayer.playing)
      {
        audioPlayer.stop();
      } else{
      audioPlayer.play();
    }
    emit(
      PlaySongLoadFailure()
    );
  }
  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}