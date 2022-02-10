import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_deeze_music/app.dart';
import 'package:my_deeze_music/bloc/album_bloc.dart';
import 'package:my_deeze_music/bloc/artist_bloc.dart';
import 'package:my_deeze_music/bloc/favorite_bloc.dart';
import 'package:my_deeze_music/bloc/music_bloc.dart';
import 'package:my_deeze_music/bloc/playlist_bloc.dart';
import 'package:my_deeze_music/bloc/search_bloc.dart';
import 'package:my_deeze_music/repository/saved_favorite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final savedFavorite = SavedFavorite();

  await savedFavorite.inizialize();

  GetIt.I.registerSingleton(savedFavorite);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => MusicBloc()),
      BlocProvider(create: (_) => SearchBloc()),
      BlocProvider(create: (_) => FavoriteBloc()),
      BlocProvider(create: (_) => AlbumBloc()),
      BlocProvider(create: (_) => ArtistBloc()),
      BlocProvider(create: (_) => PlaylistBloc()),
    ],
    child: App(),
  ));
}
