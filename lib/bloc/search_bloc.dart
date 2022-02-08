import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_deeze_music/model/track.dart';
import 'package:my_deeze_music/repository/music_repository.dart';

class SearchBloc extends Bloc<SearchBlocEvent, SearchBlocState> {
  SearchBloc() : super(SearchBlocStateStatic()) {
    on<SearchBlocEventGet>((event, emit) async {
      emit(SearchBlocStateLoading());
      final searchedSongs = await MusicRepository.search(event.inputSearch);
      emit(SearchBlocStateLoaded(searchedSongs));
    });
  }
}

/// ------ Eventi ------
abstract class SearchBlocEvent {}

class SearchBlocEventGet extends SearchBlocEvent {
  final String inputSearch;
  SearchBlocEventGet(this.inputSearch);
}

/// ------- Stati ----------
abstract class SearchBlocState {}

class SearchBlocStateLoading extends SearchBlocState {}

class SearchBlocStateStatic extends SearchBlocState {}

class SearchBlocStateLoaded extends SearchBlocState {
  final List<Track> searchedSongs;

  SearchBlocStateLoaded(this.searchedSongs);
}
