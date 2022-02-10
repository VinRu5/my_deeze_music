import 'package:flutter/material.dart';
import 'package:my_deeze_music/theme/colors.dart';

class AppSliverDetails extends StatelessWidget {
  final String picture;
  const AppSliverDetails({
    required this.picture,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: backgroundColor,
      pinned: true,
      expandedHeight: 300,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          picture,
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.darken,
          color: Colors.black26,
        ),
      ),
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
