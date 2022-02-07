class Artist {
  final int id;
  final String name;
  final String picture;

  Artist({
    required this.id,
    required this.picture,
    required this.name,
  });

  factory Artist.fromData(Map<String, dynamic> data) {
    final int id = data['id'];
    final String name = data['name'];
    final String picture = data['picture'];

    return Artist(
      id: id,
      picture: picture,
      name: name,
    );
  }
}
