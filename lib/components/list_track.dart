import 'package:flutter/material.dart';
import 'package:my_deeze_music/components/button_favorite.dart';

class ListTrack extends StatelessWidget {
  final dynamic track;
  const ListTrack({
    required this.track,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(track.picture),
          ),
          title: Text(track.title),
          subtitle: Text(track.artist),
          trailing: ButtonFavorite(track: track),
        ),
        Divider(),
      ],
    );
  }
}
