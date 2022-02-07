import 'package:flutter/material.dart';
import 'package:my_deeze_music/components/body_home.dart';
import 'package:my_deeze_music/components/bottom_button.dart';
import 'package:my_deeze_music/theme/colors.dart';

class HomePage extends StatelessWidget {
  static const String route = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: BodyHome(),
      bottomNavigationBar: BottomAppBar(
        color: bottomBarColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomButtom(
              icon: Icons.music_note,
              text: 'Musica',
            ),
            BottomButtom(
              icon: Icons.mic,
              text: 'Podcast',
            ),
            BottomButtom(
              icon: Icons.favorite,
              text: 'Preferiti',
            ),
            BottomButtom(
              icon: Icons.search,
              text: 'Cerca',
            ),
          ],
        ),
      ),
    );
  }
}
