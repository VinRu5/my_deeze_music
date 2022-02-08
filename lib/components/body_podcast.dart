import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_deeze_music/bloc/music_bloc.dart';
import 'package:my_deeze_music/components/loading.dart';

class BodyPodcast extends StatelessWidget {
  const BodyPodcast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicBloc, MusicBlocState>(builder: (context, state) {
      if (state is MusicBlocStateLoading) {
        return Loading();
      } else {
        final podcasts = (state as MusicBlocStateLoaded).podcasts;

        return SafeArea(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.6,
            ),
            itemCount: podcasts.length,
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
                      podcasts[index].picture,
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
                      podcasts[index].title,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                    ),
                    child: Text(
                      podcasts[index].description,
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
          ),
        );
      }
    });
  }
}
