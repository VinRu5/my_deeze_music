import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_deeze_music/bloc/favorite_bloc.dart';
import 'package:my_deeze_music/components/app_sliver.dart';

import 'package:my_deeze_music/components/list_track.dart';
import 'package:my_deeze_music/components/loading.dart';
import 'package:my_deeze_music/components/text_section.dart';

class BodyFavorite extends StatelessWidget {
  const BodyFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<FavoriteBloc, FavoriteBlocState>(
        builder: (context, state) {
          if (state is FavoriteBlocStateLoading) {
            return Loading();
          } else {
            final favorites = (state as FavoriteBlocStateLoaded).favorites;

            return CustomScrollView(
              slivers: [
                AppSliver(),
                TextSection(title: 'La tua musica Preferita'),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        ListTrack(track: favorites[index].track),
                    childCount: favorites.length,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
