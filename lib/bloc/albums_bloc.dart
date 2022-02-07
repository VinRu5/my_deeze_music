import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_deeze_music/model/album.dart';
import 'package:my_deeze_music/repository/music_repository.dart';

class AlbumsBloc extends Bloc<AlbumsBlocEvent, AlbumsBlocState> {
  AlbumsBloc() : super(AlbumsBlocStateLoading()) {
    on<AlbumsBlocEventInit>((event, emit) async {
      emit(AlbumsBlocStateLoading());
      final albums = await MusicRepository.topAlbums();
      emit(AlbumsBlocStateLoaded(albums));
    });
  }
}

/// -----------Eventi----------
class AlbumsBlocEvent {}

class AlbumsBlocEventInit extends AlbumsBlocEvent {}

/// -----------Stati-----------
class AlbumsBlocState {}

class AlbumsBlocStateLoading extends AlbumsBlocState {}

class AlbumsBlocStateLoaded extends AlbumsBlocState {
  final List<Album> albums;
  AlbumsBlocStateLoaded(this.albums);
}
