class Track {
  final int id;
  final String title;
  final String picture;
  final String artist;
  final String album;

  Track({
    required this.id,
    required this.picture,
    required this.title,
    required this.artist,
    required this.album,
  });

  factory Track.fromData(Map<String, dynamic> data) {
    final int id = data['id'];
    final String title = data['title'];
    final String picture = data['album']['cover_medium'];
    final String artist = data['artist']['name'];
    final String album = data['album']['title'];

    return Track(
      id: id,
      picture: picture,
      title: title,
      artist: artist,
      album: album,
    );
  }
}
