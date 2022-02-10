import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_deeze_music/model/artist.dart';
import 'package:my_deeze_music/model/track.dart';
import 'package:my_deeze_music/repository/music_repository.dart';

class ArtistBloc extends Bloc<ArtistBlocEvent, ArtistBlocState> {
  ArtistBloc() : super(ArtistBlocStateLoading()) {
    on<ArtistBlocStateInit>((event, emit) async {
      emit(ArtistBlocStateLoading());

      final tracks = await MusicRepository.getTrackByArtist(event.artist);

      emit(ArtistBlocStateLoaded(tracks));
    });
  }
}

/// -------- Eventi ---------
abstract class ArtistBlocEvent {}

class ArtistBlocStateInit extends ArtistBlocEvent {
  Artist artist;
  ArtistBlocStateInit(this.artist);
}

/// -------- Stati -----------
abstract class ArtistBlocState {}

class ArtistBlocStateLoading extends ArtistBlocState {}

class ArtistBlocStateLoaded extends ArtistBlocState {
  List<Track> tracks;
  ArtistBlocStateLoaded(this.tracks);
}
