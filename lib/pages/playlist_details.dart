import 'package:flutter/material.dart';
import 'package:my_deeze_music/model/playlist.dart';

class PlaylistDetails extends StatelessWidget {
  static const route = '/playlist/details';

  final PlaylistDetailsArgs arg;
  const PlaylistDetails({
    required this.arg,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PlaylistDetailsArgs {
  Playlist playlist;
  PlaylistDetailsArgs({required this.playlist});
}
