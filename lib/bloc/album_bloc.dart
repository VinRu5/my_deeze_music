import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_deeze_music/model/album.dart';
import 'package:my_deeze_music/model/track.dart';
import 'package:my_deeze_music/repository/music_repository.dart';

class AlbumBloc extends Bloc<AlbumBlocEvent, AlbumBlocState> {
  AlbumBloc() : super(AlbumBlocStateLoading()) {
    on<AlbumBlocStateInit>((event, emit) async {
      emit(AlbumBlocStateLoading());

      final tracks = await MusicRepository.getTrackByAlbum(event.album);

      emit(AlbumBlocStateLoaded(tracks));
    });
  }
}

/// -------- Eventi ---------
abstract class AlbumBlocEvent {}

class AlbumBlocStateInit extends AlbumBlocEvent {
  Album album;
  AlbumBlocStateInit(this.album);
}

/// -------- Stati -----------
abstract class AlbumBlocState {}

class AlbumBlocStateLoading extends AlbumBlocState {}

class AlbumBlocStateLoaded extends AlbumBlocState {
  List<Track> tracks;
  AlbumBlocStateLoaded(this.tracks);
}
