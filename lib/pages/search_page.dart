import 'package:flutter/material.dart';
import 'package:my_deeze_music/components/body_search.dart';
import 'package:my_deeze_music/components/bottom_bar.dart';
import 'package:my_deeze_music/theme/colors.dart';

class SearchPage extends StatelessWidget {
  static const route = '/search';
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: BodySearch(),
      bottomNavigationBar: BottomBar(
        currentPage: 'search',
      ),
    );
  }
}
