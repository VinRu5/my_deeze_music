import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_deeze_music/bloc/artist_bloc.dart';
import 'package:my_deeze_music/components/app_sliver_details.dart';
import 'package:my_deeze_music/components/list_track.dart';
import 'package:my_deeze_music/components/loading.dart';
import 'package:my_deeze_music/components/text_section.dart';
import 'package:my_deeze_music/model/artist.dart';
import 'package:my_deeze_music/theme/colors.dart';

class ArtistDetails extends StatefulWidget {
  static const route = '/artist/details';

  final ArtistDetailsArgs arg;
  const ArtistDetails({
    required this.arg,
    Key? key,
  }) : super(key: key);

  @override
  State<ArtistDetails> createState() => _ArtistDetailsState();
}

class _ArtistDetailsState extends State<ArtistDetails> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<ArtistBloc>(context).add(
      ArtistBlocStateInit(widget.arg.artist),
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
      BlocBuilder<ArtistBloc, ArtistBlocState>(builder: (context, state) {
        if (state is ArtistBlocStateLoading) {
          return Loading();
        } else {
          final tracks = (state as ArtistBlocStateLoaded).tracks;
          return CustomScrollView(
            slivers: [
              AppSliverDetails(picture: widget.arg.artist.picture),
              TextSection(title: widget.arg.artist.name),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Le più popolari di ${widget.arg.artist.name}',
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
                  (context, index) => ListTrack(track: tracks[index]),
                  childCount: tracks.length,
                ),
              ),
            ],
          );
        }
      });
}

class ArtistDetailsArgs {
  Artist artist;
  ArtistDetailsArgs({required this.artist});
}
