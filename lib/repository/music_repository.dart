import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_deeze_music/model/album.dart';
import 'package:my_deeze_music/model/artist.dart';
import 'package:my_deeze_music/model/playlist.dart';
import 'package:my_deeze_music/model/podcast.dart';
import 'package:my_deeze_music/model/track.dart';

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

  static Future<List<Track>> topTracks() async {
    final url = Uri.parse('https://api.deezer.com/chart/0/tracks');

    final response = await http.get(url);

    final jsonData = json.decode(response.body);

    final tracks = (jsonData['data'] as List<dynamic>).map((track) {
      return Track.fromData(track);
    }).toList();

    return tracks;
  }

  static Future<List<Playlist>> topPlaylists() async {
    final url = Uri.parse('https://api.deezer.com/chart/0/playlists');

    final response = await http.get(url);

    final jsonData = json.decode(response.body);

    final playlists = (jsonData['data'] as List<dynamic>).map((playlist) {
      return Playlist.fromData(playlist);
    }).toList();

    return playlists;
  }

  static Future<List<Artist>> topArtists() async {
    final url = Uri.parse('https://api.deezer.com/chart/0/artists');

    final response = await http.get(url);

    final jsonData = json.decode(response.body);

    final artists = (jsonData['data'] as List<dynamic>).map((artist) {
      return Artist.fromData(artist);
    }).toList();

    return artists;
  }
}
