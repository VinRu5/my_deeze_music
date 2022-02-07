class Album {
  final int id;
  final String title;
  final String picture;
  final String artist;

  Album({
    required this.id,
    required this.picture,
    required this.title,
    required this.artist,
  });

  factory Album.fromData(Map<String, dynamic> data) {
    final int id = data['id'];
    final String title = data['title'];
    final String picture = data['cover_medium'];
    final String artist = data['artist']['name'];

    return Album(id: id, picture: picture, title: title, artist: artist);
  }
}
