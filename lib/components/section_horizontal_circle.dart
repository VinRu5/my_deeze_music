import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_deeze_music/bloc/artist_bloc.dart';
import 'package:my_deeze_music/pages/artist_details.dart';

class SectionHorizontalCircle extends StatelessWidget {
  final String title;
  final List<dynamic> sectionData;
  const SectionHorizontalCircle({
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ArtistDetails.route,
                      arguments: ArtistDetailsArgs(
                        artist: sectionData[index],
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(sectionData[index].picture),
                        radius: 80,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8,
                        ),
                        child: Text(
                          sectionData[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
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
