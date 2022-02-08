import 'package:flutter/material.dart';
import 'package:my_deeze_music/pages/favorite_page.dart';
import 'package:my_deeze_music/pages/home_page.dart';
import 'package:my_deeze_music/pages/podcast_page.dart';
import 'package:my_deeze_music/pages/search_page.dart';

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
