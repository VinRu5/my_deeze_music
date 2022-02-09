import 'package:flutter/material.dart';
import 'package:my_deeze_music/components/button_favorite.dart';

class SectionHorizontalTrack extends StatelessWidget {
  final String title;
  final List<dynamic> sectionData;
  const SectionHorizontalTrack({
    required this.title,
    required this.sectionData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              itemCount: sectionData.length,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.only(left: 16),
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          Image.network(
                            sectionData[index].picture,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          ButtonFavorite(track: sectionData[index]),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8,
                      ),
                      child: Text(
                        sectionData[index].title,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                      ),
                      child: Text(
                        sectionData[index].artist,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white54,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
