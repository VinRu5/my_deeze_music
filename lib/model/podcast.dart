class Podcast {
  final int id;
  final String title;
  final String description;
  final String picture;

  Podcast({
    required this.description,
    required this.id,
    required this.picture,
    required this.title,
  });

  factory Podcast.fromData(Map<String, dynamic> data) {
    final int id = data['id'];
    final String title = data['title'];
    final String description = data['description'];
    final String picture = data['picture'];

    return Podcast(
      description: description,
      id: id,
      picture: picture,
      title: title,
    );
  }
}
