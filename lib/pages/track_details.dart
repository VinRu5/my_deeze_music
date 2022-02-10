import 'package:flutter/material.dart';

import 'package:my_deeze_music/components/button_favorite.dart';

import 'package:my_deeze_music/model/track.dart';
import 'package:my_deeze_music/theme/colors.dart';

class TrackDetails extends StatelessWidget {
  static const route = '/track/details';

  final TrackDetailsArgs arg;
  final Color colorBase = (colors..shuffle()).first;

  TrackDetails({
    required this.arg,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorBase,
      ),
      backgroundColor: backgroundColor,
      body: body(),
    );
  }

  Widget body() => Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: colorBase,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: SizedBox(
                width: 300,
                height: 300,
                child: Image.network(
                  arg.track.picture,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 100),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.ios_share),
                SizedBox(width: 24),
                Icon(Icons.more_horiz),
                SizedBox(width: 24),
                ButtonFavorite(track: arg.track),
              ],
            ),
            Slider(
              inactiveColor: Colors.white54,
              thumbColor: Colors.white,
              activeColor: Colors.white,
              value: 0,
              min: 0,
              max: 100,
              divisions: 10,
              onChanged: (value) {},
            ),
            Text(
              arg.track.title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${arg.track.artist} - ${arg.track.album}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white60,
              ),
            ),
          ],
        ),
      );
}

class TrackDetailsArgs {
  Track track;

  TrackDetailsArgs({required this.track});
}

final colors = [
  Color(0xFF66FFBE),
  Color(0xFFFFF267),
  Color(0xFFFFB968),
  Color(0xFF80E0FF),
  Color(0xFF9980FF),
  Color(0xFFD680FF),
  Color(0xFFFF7FB5),
];
