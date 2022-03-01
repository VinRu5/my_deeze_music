import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_deeze_music/bloc/search_bloc.dart';
import 'package:my_deeze_music/theme/colors.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController searchString = TextEditingController();
  SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: backgroundColor,
      pinned: true,
      leading: SizedBox(),
      centerTitle: true,
      title: TextField(
        controller: searchString,
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              BlocProvider.of<SearchBloc>(context)
                  .add(SearchBlocEventGet(searchString.text));
              searchString.clear();
            },
          ),
          hintText: 'Cerca la tua musica...',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
