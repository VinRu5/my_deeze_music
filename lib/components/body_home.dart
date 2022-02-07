import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_deeze_music/bloc/albums_bloc.dart';
import 'package:my_deeze_music/components/section_horizontal.dart';
import 'package:my_deeze_music/model/podcast.dart';
import 'package:my_deeze_music/repository/music_repository.dart';
import 'package:my_deeze_music/theme/colors.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  //late Future<List<Podcast>> podcasts;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AlbumsBloc>(context).add(AlbumsBlocEventInit());
    //podcasts = PodcastRepository.topPodcast();
  }

  @override
  Widget build(BuildContext context) {
    //return Container();
    return BlocBuilder<AlbumsBloc, AlbumsBlocState>(builder: (context, state) {
      if (state is AlbumsBlocStateLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        final albums = (state as AlbumsBlocStateLoaded).albums;

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 24, 0, 32),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: backgroundColor,
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.notifications),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.settings),
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Musica',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SectionHorizontal(
                  title: 'Album Popolari',
                  sectionData: albums,
                )
              ],
            ),
          ),
        );
      }
    });
  }
}
