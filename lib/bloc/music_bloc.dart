import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_deeze_music/model/album.dart';
import 'package:my_deeze_music/model/artist.dart';
import 'package:my_deeze_music/model/playlist.dart';
import 'package:my_deeze_music/model/podcast.dart';
import 'package:my_deeze_music/model/track.dart';
import 'package:my_deeze_music/repository/music_repository.dart';

class MusicBloc extends Bloc<MusicBlocEvent, MusicBlocState> {
  MusicBloc() : super(MusicBlocStateLoading()) {
    on<MusicBlocEventInit>((event, emit) async {
      emit(MusicBlocStateLoading());
      final albums = await MusicRepository.topAlbums();
      final artists = await MusicRepository.topArtists();
      final playlists = await MusicRepository.topPlaylists();
      final podcasts = await MusicRepository.topPodcasts();
      final tracks = await MusicRepository.topTracks();

      emit(MusicBlocStateLoaded(
        albums: albums,
        artists: artists,
        playlists: playlists,
        podcasts: podcasts,
        tracks: tracks,
      ));
    });
  }
}

/// ----------Eventi------------
abstract class MusicBlocEvent {}

class MusicBlocEventInit extends MusicBlocEvent {}

/// ------------Stati------------
abstract class MusicBlocState {}

class MusicBlocStateLoading extends MusicBlocState {}

class MusicBlocStateLoaded extends MusicBlocState {
  final List<Album> albums;
  final List<Artist> artists;
  final List<Playlist> playlists;
  final List<Podcast> podcasts;
  final List<Track> tracks;

  MusicBlocStateLoaded({
    required this.albums,
    required this.artists,
    required this.playlists,
    required this.podcasts,
    required this.tracks,
  });
}
