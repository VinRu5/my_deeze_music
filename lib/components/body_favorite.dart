import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_deeze_music/bloc/favorite_bloc.dart';
import 'package:my_deeze_music/components/button_favorite.dart';
import 'package:my_deeze_music/components/loading.dart';

class BodyFavorite extends StatefulWidget {
  const BodyFavorite({Key? key}) : super(key: key);

  @override
  State<BodyFavorite> createState() => _BodyFavoriteState();
}

class _BodyFavoriteState extends State<BodyFavorite> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FavoriteBloc>(context).add(FavoriteBlocEventInit());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<FavoriteBloc, FavoriteBlocState>(
        builder: (context, state) {
          if (state is FavoriteBlocStateLoading) {
            return Loading();
          } else {
            final favorites = (state as FavoriteBlocStateLoaded).favorites;

            return ListView.separated(
              itemBuilder: (context, index) => ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(favorites[index].track.picture),
                ),
                title: Text(favorites[index].track.title),
                subtitle: Text(favorites[index].track.artist),
                trailing: ButtonFavorite(track: favorites[index].track),
              ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: favorites.length,
            );
          }
        },
      ),
    );
  }
}
