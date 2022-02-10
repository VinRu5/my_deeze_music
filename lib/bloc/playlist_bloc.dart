import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_deeze_music/model/playlist.dart';

import 'package:my_deeze_music/repository/music_repository.dart';

class PlaylistBloc extends Bloc<PlaylistBlocEvent, PlaylistBlocState> {
  PlaylistBloc() : super(PlaylistBlocStateLoading()) {
    on<PlaylistBlocStateInit>((event, emit) async {
      emit(PlaylistBlocStateLoading());

      final playlist = await MusicRepository.getPlaylist(event.playlist);

      emit(PlaylistBlocStateLoaded(playlist));
    });
  }
}

/// -------- Eventi ---------
abstract class PlaylistBlocEvent {}

class PlaylistBlocStateInit extends PlaylistBlocEvent {
  Playlist playlist;
  PlaylistBlocStateInit(this.playlist);
}

/// -------- Stati -----------
abstract class PlaylistBlocState {}

class PlaylistBlocStateLoading extends PlaylistBlocState {}

class PlaylistBlocStateLoaded extends PlaylistBlocState {
  PlaylistById playlist;
  PlaylistBlocStateLoaded(this.playlist);
}
