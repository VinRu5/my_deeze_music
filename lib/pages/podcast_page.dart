import 'package:flutter/material.dart';
import 'package:my_deeze_music/components/body_podcast.dart';
import 'package:my_deeze_music/components/bottom_bar.dart';
import 'package:my_deeze_music/theme/colors.dart';

class PodcastPage extends StatefulWidget {
  static const route = '/podcast';
  const PodcastPage({Key? key}) : super(key: key);

  @override
  _PodcastPageState createState() => _PodcastPageState();
}

class _PodcastPageState extends State<PodcastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: BodyPodcast(),
      bottomNavigationBar: BottomBar(),
    );
  }
}
