import 'package:flutter/material.dart';
import 'package:my_deeze_music/components/bottom_button.dart';
import 'package:my_deeze_music/pages/favorite_page.dart';
import 'package:my_deeze_music/pages/home_page.dart';
import 'package:my_deeze_music/pages/podcast_page.dart';
import 'package:my_deeze_music/pages/search_page.dart';
import 'package:my_deeze_music/theme/colors.dart';

class BottomBar extends StatelessWidget {
  final String currentPage;

  const BottomBar({
    required this.currentPage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: bottomBarColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomButtom(
            icon: currentPage == 'home'
                ? Icons.music_note
                : Icons.music_note_outlined,
            text: 'Musica',
            onPressed: () {
              Navigator.pushNamed(context, HomePage.route);
            },
          ),
          BottomButtom(
            icon: currentPage == 'podcast' ? Icons.mic : Icons.mic_outlined,
            text: 'Podcast',
            onPressed: () {
              Navigator.pushNamed(context, PodcastPage.route);
            },
          ),
          BottomButtom(
            icon: currentPage == 'podcast'
                ? Icons.favorite
                : Icons.favorite_outlined,
            text: 'Preferiti',
            onPressed: () {
              Navigator.pushNamed(context, FavoritePage.route);
            },
          ),
          BottomButtom(
            icon:
                currentPage == 'podcast' ? Icons.search : Icons.search_outlined,
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
