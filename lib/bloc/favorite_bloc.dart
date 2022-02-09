import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_deeze_music/model/favorite_model.dart';
import 'package:my_deeze_music/model/track.dart';
import 'package:my_deeze_music/repository/saved_favorite.dart';

class FavoriteBloc extends Bloc<FavoriteBlocEvent, FavoriteBlocState> {
  FavoriteBloc() : super(FavoriteBlocStateLoading()) {
    /// inizializzo la lista dei prefeti facendo la query al database
    on<FavoriteBlocEventInit>((event, emit) async {
      emit(FavoriteBlocStateLoading());

      final List<FavoriteModel> favorites =
          await GetIt.I.get<SavedFavorite>().all();

      emit(FavoriteBlocStateLoaded(favorites));
    });

    /// aggiungo un elemento ai preferiti
    on<FavoriteBlocEventAdd>((event, emit) async {
      await GetIt.I.get<SavedFavorite>().create(event.track);

      final List<FavoriteModel> favorites =
          await GetIt.I.get<SavedFavorite>().all();

      emit(FavoriteBlocStateLoaded(favorites));
    });

    /// elimino un elemento dei preferiti
    on<FavoriteBlocEventRemove>((event, emit) async {
      await GetIt.I.get<SavedFavorite>().delete(event.track);

      final List<FavoriteModel> favorites =
          await GetIt.I.get<SavedFavorite>().all();

      emit(FavoriteBlocStateLoaded(favorites));
    });
  }
}

/// ------ Eventi ------------
abstract class FavoriteBlocEvent {}

class FavoriteBlocEventInit extends FavoriteBlocEvent {}

class FavoriteBlocEventAdd extends FavoriteBlocEvent {
  final Track track;

  FavoriteBlocEventAdd(this.track);
}

class FavoriteBlocEventRemove extends FavoriteBlocEvent {
  final Track track;

  FavoriteBlocEventRemove(this.track);
}

/// ------ Stati ------------
abstract class FavoriteBlocState {}

class FavoriteBlocStateLoading extends FavoriteBlocState {}

class FavoriteBlocStateLoaded extends FavoriteBlocState {
  final List<FavoriteModel> favorites;

  FavoriteBlocStateLoaded(this.favorites);
}
