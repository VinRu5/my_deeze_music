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
