import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_deeze_music/bloc/playlist_bloc.dart';
import 'package:my_deeze_music/components/app_sliver_details.dart';
import 'package:my_deeze_music/components/list_track.dart';
import 'package:my_deeze_music/components/loading.dart';
import 'package:my_deeze_music/components/text_section.dart';
import 'package:my_deeze_music/model/playlist.dart';

import 'package:my_deeze_music/theme/colors.dart';

class PlaylistDetails extends StatefulWidget {
  static const route = '/playlist/details';

  final PlaylistDetailsArgs arg;
  const PlaylistDetails({
    required this.arg,
    Key? key,
  }) : super(key: key);

  @override
  State<PlaylistDetails> createState() => _PlaylistDetailsState();
}

class _PlaylistDetailsState extends State<PlaylistDetails> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<PlaylistBloc>(context).add(
      PlaylistBlocStateInit(widget.arg.playlist),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: body(),
    );
  }

  Widget body() =>
      BlocBuilder<PlaylistBloc, PlaylistBlocState>(builder: (context, state) {
        if (state is PlaylistBlocStateLoading) {
          return Loading();
        } else {
          final playlist = (state as PlaylistBlocStateLoaded).playlist;
          return CustomScrollView(
            slivers: [
              AppSliverDetails(picture: playlist.picture),
              TextSection(title: playlist.title),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        playlist.creator,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTrack(track: playlist.tracks[index]),
                  childCount: playlist.tracks.length,
                ),
              ),
            ],
          );
        }
      });
}

class PlaylistDetailsArgs {
  Playlist playlist;
  PlaylistDetailsArgs({required this.playlist});
}
