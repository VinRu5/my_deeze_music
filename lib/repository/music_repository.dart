import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_deeze_music/model/album.dart';
import 'package:my_deeze_music/model/podcast.dart';

class MusicRepository {
  static Future<List<Podcast>> topPodcasts() async {
    final url = Uri.parse('https://api.deezer.com/chart/0/podcasts');

    final response = await http.get(url);

    final jsonData = json.decode(response.body);

    final podcasts = (jsonData['data'] as List<dynamic>).map((podcast) {
      return Podcast.fromData(podcast);
    }).toList();

    return podcasts;
  }

  static Future<List<Album>> topAlbums() async {
    final url = Uri.parse('https://api.deezer.com/chart/0/albums');

    final response = await http.get(url);

    final jsonData = json.decode(response.body);

    final albums = (jsonData['data'] as List<dynamic>).map((album) {
      return Album.fromData(album);
    }).toList();

    return albums;
  }
}
