import 'package:flutter/material.dart';
import 'package:my_deeze_music/model/album.dart';
import 'package:my_deeze_music/model/playlist.dart';
import 'package:my_deeze_music/model/track.dart';
import 'package:my_deeze_music/pages/album_details.dart';
import 'package:my_deeze_music/pages/playlist_details.dart';
import 'package:my_deeze_music/pages/track_details.dart';

class SectionHorizontal extends StatelessWidget {
  final String title;
  final List<dynamic> sectionData;
  const SectionHorizontal({
    required this.title,
    required this.sectionData,
    Key? key,
  }) : super(key: key);

  void openDetails(BuildContext context, dynamic data) {
    switch (data.runtimeType) {
      case Track:
        Navigator.pushNamed(context, TrackDetails.route,
            arguments: TrackDetailsArgs(track: data));
        break;
      case Playlist:
        Navigator.pushNamed(context, PlaylistDetails.route,
            arguments: PlaylistDetailsArgs(playlist: data));
        break;
      case Album:
        Navigator.pushNamed(context, AlbumDetails.route,
            arguments: AlbumDetailsArgs(album: data));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              itemCount: sectionData.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => openDetails(context, sectionData[index]),
                child: Container(
                  margin: EdgeInsets.only(left: 16),
                  width: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          sectionData[index].picture,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8,
                        ),
                        child: Text(
                          sectionData[index].title,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                        ),
                        child: Text(
                          sectionData[index].artist,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white54,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
