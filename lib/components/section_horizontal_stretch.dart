import 'package:flutter/material.dart';

class SectionHorizontalStretch extends StatelessWidget {
  final String title;
  final List<dynamic> sectionData;
  const SectionHorizontalStretch({
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
            height: 300,
            child: ListView.builder(
              itemCount: sectionData.length,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.only(left: 16),
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Image.network(
                        sectionData[index].picture,
                        width: double.infinity,
                        height: 120,
                        fit: BoxFit.cover,
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
                        sectionData[index].description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 6,
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
