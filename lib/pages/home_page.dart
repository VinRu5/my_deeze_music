import 'package:flutter/material.dart';
import 'package:my_deeze_music/components/body_home.dart';
import 'package:my_deeze_music/components/bottom_bar.dart';
import 'package:my_deeze_music/theme/colors.dart';

class HomePage extends StatelessWidget {
  static const String route = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: BodyHome(),
      bottomNavigationBar: BottomBar(
        currentPage: 'home',
      ),
    );
  }
}
