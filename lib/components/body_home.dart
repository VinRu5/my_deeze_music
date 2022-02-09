import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_deeze_music/bloc/music_bloc.dart';
import 'package:my_deeze_music/components/app_sliver.dart';
import 'package:my_deeze_music/components/section_horizontal.dart';
import 'package:my_deeze_music/components/section_horizontal_circle.dart';
import 'package:my_deeze_music/components/section_horizontal_stretch.dart';
import 'package:my_deeze_music/components/section_horizontal_track.dart';
import 'package:my_deeze_music/components/text_section.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MusicBloc>(context).add(MusicBlocEventInit());
  }

  @override
  Widget build(BuildContext context) {
    //return Container();
    return BlocBuilder<MusicBloc, MusicBlocState>(builder: (context, state) {
      if (state is MusicBlocStateLoading) {
        return Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        );
      } else {
        final stateMusic = (state as MusicBlocStateLoaded);
        final albums = stateMusic.albums;
        final artists = stateMusic.artists;
        final playlists = stateMusic.playlists;
        final podcasts = stateMusic.podcasts;
        final tracks = stateMusic.tracks;

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 24, 0, 32),
            child: CustomScrollView(
              slivers: [
                AppSliver(),
                TextSection(title: 'Musica'),
                SectionHorizontalCircle(
                  title: 'Top Artisti',
                  sectionData: artists,
                ),
                SectionHorizontalTrack(
                  title: 'Le canzoni più ascoltate del momento',
                  sectionData: tracks,
                ),
                SectionHorizontal(
                  title: 'Album Popolari',
                  sectionData: albums,
                ),
                SectionHorizontalStretch(
                  title: 'Podcast',
                  sectionData: podcasts,
                ),
                SectionHorizontal(
                  title: 'Playlist di successo',
                  sectionData: playlists,
                ),
              ],
            ),
          ),
        );
      }
    });
  }
}
