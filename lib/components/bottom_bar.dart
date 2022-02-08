import 'package:flutter/material.dart';
import 'package:my_deeze_music/components/bottom_button.dart';
import 'package:my_deeze_music/pages/favorite_page.dart';
import 'package:my_deeze_music/pages/home_page.dart';
import 'package:my_deeze_music/pages/podcast_page.dart';
import 'package:my_deeze_music/pages/search_page.dart';
import 'package:my_deeze_music/theme/colors.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: bottomBarColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomButtom(
            icon: Icons.music_note,
            text: 'Musica',
            onPressed: () {
              Navigator.pushNamed(context, HomePage.route);
            },
          ),
          BottomButtom(
            icon: Icons.mic,
            text: 'Podcast',
            onPressed: () {
              Navigator.pushNamed(context, PodcastPage.route);
            },
          ),
          BottomButtom(
            icon: Icons.favorite,
            text: 'Preferiti',
            onPressed: () {
              Navigator.pushNamed(context, FavoritePage.route);
            },
          ),
          BottomButtom(
            icon: Icons.search,
            text: 'Cerca',
            onPressed: () {
              Navigator.pushNamed(context, SearchPage.route);
            },
          ),
        ],
      ),
    );
  }
}
