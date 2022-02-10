import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_deeze_music/bloc/album_bloc.dart';
import 'package:my_deeze_music/components/app_sliver_details.dart';
import 'package:my_deeze_music/components/loading.dart';
import 'package:my_deeze_music/components/text_section.dart';
import 'package:my_deeze_music/model/album.dart';
import 'package:my_deeze_music/theme/colors.dart';

class AlbumDetails extends StatefulWidget {
  static const route = '/album/details';

  final AlbumDetailsArgs arg;
  const AlbumDetails({
    required this.arg,
    Key? key,
  }) : super(key: key);

  @override
  State<AlbumDetails> createState() => _AlbumDetailsState();
}

class _AlbumDetailsState extends State<AlbumDetails> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<AlbumBloc>(context).add(
      AlbumBlocStateInit(widget.arg.album),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: body(),
    );
  }

  Widget body() =>
      BlocBuilder<AlbumBloc, AlbumBlocState>(builder: (context, state) {
        if (state is AlbumBlocStateLoading) {
          return Loading();
        } else {
          final tracks = (state as AlbumBlocStateLoaded).tracks;
          return CustomScrollView(
            slivers: [
              AppSliverDetails(picture: widget.arg.album.picture),
              TextSection(title: widget.arg.album.title),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        widget.arg.album.artist,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => ListTile(
                          title: Text(tracks[index].title),
                        ),
                    childCount: tracks.length),
              ),
            ],
          );
        }
      });
}

class AlbumDetailsArgs {
  Album album;
  AlbumDetailsArgs({required this.album});
}
