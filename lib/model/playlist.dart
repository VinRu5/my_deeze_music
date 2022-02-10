import 'package:my_deeze_music/model/track.dart';

class Playlist {
  final int id;
  final String title;
  final String picture;
  final String artist;

  Playlist({
    required this.id,
    required this.picture,
    required this.title,
    required this.artist,
  });

  factory Playlist.fromData(Map<String, dynamic> data) {
    final int id = data['id'];
    final String title = data['title'];
    final String picture = data['picture'];
    final String artist = data['user']['name'];

    return Playlist(
      id: id,
      picture: picture,
      title: title,
      artist: artist,
    );
  }
}

/// --------------------------------

class PlaylistById {
  final int id;
  final String title;
  final String picture;
  final String creator;
  final List<Track> tracks;

  PlaylistById({
    required this.id,
    required this.picture,
    required this.title,
    required this.creator,
    required this.tracks,
  });

  factory PlaylistById.fromData(Map<String, dynamic> data) {
    final int id = data['id'];
    final String title = data['title'];
    final String picture = data['picture'];
    final String creator = data['creator']['name'];
    final List<Track> tracks = (data['tracks']['data'] as List<dynamic>)
        .map((track) => Track.fromData(track))
        .toList();

    return PlaylistById(
      id: id,
      picture: picture,
      title: title,
      creator: creator,
      tracks: tracks,
    );
  }
}
