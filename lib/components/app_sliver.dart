import 'package:flutter/material.dart';
import 'package:my_deeze_music/theme/colors.dart';

class AppSliver extends StatelessWidget {
  const AppSliver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: backgroundColor,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_outlined),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings_outlined),
        ),
      ],
    );
  }
}
