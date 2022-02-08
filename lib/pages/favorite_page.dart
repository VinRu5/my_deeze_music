import 'package:flutter/material.dart';
import 'package:my_deeze_music/components/body_favorite.dart';
import 'package:my_deeze_music/components/bottom_bar.dart';
import 'package:my_deeze_music/theme/colors.dart';

class FavoritePage extends StatefulWidget {
  static const route = '/favorite';
  FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: BodyFavorite(),
      bottomNavigationBar: BottomBar(),
    );
  }
}
