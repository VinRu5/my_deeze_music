import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_deeze_music/model/podcast.dart';

class PodcastRepository {
  static Future<List<Podcast>> topPodcast() async {
    final url = Uri.parse('https://api.deezer.com/chart/0/podcasts');

    final response = await http.get(url);

    final jsonData = json.decode(response.body);

    final podcasts = (jsonData['data'] as List<dynamic>).map((podcast) {
      return Podcast.fromData(podcast);
    }).toList();

    return podcasts;
  }
}
