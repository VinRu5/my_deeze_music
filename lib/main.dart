import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_deeze_music/app.dart';
import 'package:my_deeze_music/bloc/music_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => MusicBloc()),
    ],
    child: App(),
  ));
}
