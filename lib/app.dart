import 'package:flutter/material.dart';
import 'package:my_deeze_music/pages/album_details.dart';
import 'package:my_deeze_music/pages/artist_details.dart';
import 'package:my_deeze_music/pages/favorite_page.dart';
import 'package:my_deeze_music/pages/home_page.dart';
import 'package:my_deeze_music/pages/playlist_details.dart';
import 'package:my_deeze_music/pages/podcast_details.dart';
import 'package:my_deeze_music/pages/podcast_page.dart';
import 'package:my_deeze_music/pages/search_page.dart';
import 'package:my_deeze_music/pages/track_details.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.route,
      onGenerateRoute: (settings) {
        final routes = {
          HomePage.route: (_) => HomePage(),
          PodcastPage.route: (_) => PodcastPage(),
          FavoritePage.route: (_) => FavoritePage(),
          SearchPage.route: (_) => SearchPage(),
          AlbumDetails.route: (_) => AlbumDetails(
                arg: settings.arguments as AlbumDetailsArgs,
              ),
          ArtistDetails.route: (_) => ArtistDetails(
                arg: settings.arguments as ArtistDetailsArgs,
              ),
          PlaylistDetails.route: (_) => PlaylistDetails(
                arg: settings.arguments as PlaylistDetailsArgs,
              ),
          PodcastDetails.route: (_) => PodcastDetails(),
          TrackDetails.route: (_) =>
              TrackDetails(arg: settings.arguments as TrackDetailsArgs),
        };

        return MaterialPageRoute(builder: routes[settings.name]!);
      },
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Mabry',
      ),
    );
  }
}
