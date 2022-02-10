import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_deeze_music/bloc/favorite_bloc.dart';
import 'package:my_deeze_music/components/loading.dart';
import 'package:my_deeze_music/model/track.dart';

class ButtonFavorite extends StatelessWidget {
  final Track track;
  const ButtonFavorite({
    required this.track,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteBlocState>(
        builder: (context, state) {
      if (state is FavoriteBlocStateLoading) {
        return Loading();
      } else {
        final favorites = (state as FavoriteBlocStateLoaded).favorites;
        final favoriteSong =
            favorites.any((favorite) => favorite.track.id == track.id);

        return Positioned(
          bottom: 10,
          right: 10,
          child: IconButton(
            icon: favoriteSong
                ? Icon(
                    Icons.favorite,
                    color: Colors.white70,
                    size: 25,
                  )
                : Icon(
                    Icons.favorite_outline,
                    color: Colors.white70,
                    size: 25,
                  ),
            onPressed: () {
              if (favoriteSong) {
                BlocProvider.of<FavoriteBloc>(context)
                    .add(FavoriteBlocEventRemove(track));
              } else {
                BlocProvider.of<FavoriteBloc>(context)
                    .add(FavoriteBlocEventAdd(track));
              }
            },
          ),
        );
      }
    });
  }
}
