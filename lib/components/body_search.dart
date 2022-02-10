import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_deeze_music/bloc/search_bloc.dart';
import 'package:my_deeze_music/components/app_sliver.dart';
import 'package:my_deeze_music/components/button_favorite.dart';
import 'package:my_deeze_music/components/list_track.dart';
import 'package:my_deeze_music/components/loading.dart';
import 'package:my_deeze_music/components/search_bar.dart';
import 'package:my_deeze_music/components/text_section.dart';
import 'package:my_deeze_music/model/track.dart';

class BodySearch extends StatelessWidget {
  const BodySearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchBlocState>(builder: (context, state) {
      switch (state.runtimeType) {
        case SearchBlocStateLoading:
          return BasePage(
            child: SliverToBoxAdapter(
              child: Loading(),
            ),
          );

        case SearchBlocStateLoaded:
          final searchedSongs = (state as SearchBlocStateLoaded).searchedSongs;
          return BasePage(
            child: LoadedPage(searchedSongs),
          );

        default:
          return BasePage(
            child: StaticPage(),
          );
      }
    });
  }
}

class BasePage extends StatelessWidget {
  final Widget child;
  const BasePage({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: [
          AppSliver(),
          TextSection(title: 'Cerca'),
          SearchBar(),
          child,
        ],
      );
}

class LoadedPage extends StatelessWidget {
  final List<Track> searchedSongs;
  const LoadedPage(
    this.searchedSongs, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => ListTrack(track: searchedSongs[index]),
          childCount: searchedSongs.length,
        ),
      );
}

class StaticPage extends StatelessWidget {
  const StaticPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverList(
        delegate: SliverChildListDelegate([
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3),
                height: double.infinity,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                ),
                child: Image.asset(
                  'assets/images/deezer.png',
                ),
              ),
            ),
            title: Text('Cerca tutta la musica che vuoi'),
            subtitle: Text('Aggiungi ai tuoi preferiti'),
            trailing: Icon(Icons.play_circle_outline),
          ),
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3),
                height: double.infinity,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.blueAccent.shade200,
                ),
                child: Image.asset(
                  'assets/images/deezer.png',
                ),
              ),
            ),
            title: Text('Cerca tutta la musica che vuoi'),
            subtitle: Text('Aggiungi ai tuoi preferiti'),
            trailing: Icon(Icons.play_circle_outline),
          ),
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3),
                height: double.infinity,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                ),
                child: Image.asset(
                  'assets/images/deezer.png',
                ),
              ),
            ),
            title: Text('Cerca tutta la musica che vuoi'),
            subtitle: Text('Aggiungi ai tuoi preferiti'),
            trailing: Icon(Icons.play_circle_outline),
          ),
        ]),
      );
}
