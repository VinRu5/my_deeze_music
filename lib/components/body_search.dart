import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_deeze_music/bloc/search_bloc.dart';
import 'package:my_deeze_music/components/app_sliver.dart';
import 'package:my_deeze_music/components/loading.dart';
import 'package:my_deeze_music/components/search_bar.dart';
import 'package:my_deeze_music/components/text_section.dart';

class BodySearch extends StatelessWidget {
  const BodySearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchBlocState>(builder: (context, state) {
      switch (state.runtimeType) {
        case SearchBlocStateLoading:
          return BasePage(
            child: SliverToBoxAdapter(
              child: Loading(),
            ),
          );

        case SearchBlocStateLoaded:
          return BasePage(
            child: LoadedPage(),
          );

        default:
          return BasePage(
            child: StaticPage(),
          );
      }
    });
  }
}

class BasePage extends StatelessWidget {
  final Widget child;
  const BasePage({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: [
          AppSliver(),
          TextSection(title: 'Cerca'),
          SearchBar(),
          child,
        ],
      );
}

class LoadedPage extends StatelessWidget {
  const LoadedPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => ListTile(
            title: Text('ciao'),
          ),
          childCount: 10,
        ),
      );
}

class StaticPage extends StatelessWidget {
  const StaticPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => ListTile(
            title: Text('static'),
          ),
          childCount: 10,
        ),
      );
}
