import 'package:flutter/material.dart';
import 'package:my_deeze_music/components/body_favorite.dart';
import 'package:my_deeze_music/components/bottom_bar.dart';
import 'package:my_deeze_music/theme/colors.dart';

class FavoritePage extends StatelessWidget {
  static const route = '/favorite';
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: BodyFavorite(),
      bottomNavigationBar: BottomBar(
        currentPage: 'favorite',
      ),
    );
  }
}
