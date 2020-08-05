import 'package:cst407_assignment_3/cards/animelistcard.dart';
import 'package:flutter/material.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import '../state/animeliststate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopAnimeList extends StatelessWidget {
  const TopAnimeList({Key key, this.subtype}) : super(key: key);

  final TopSubtype subtype;

  @override
  Widget build(BuildContext context) {
    final _pageController = PagewiseLoadController(
        pageSize: 10,
        pageFuture: (pageIndex) => jikan
            .read(context)
            .getTop(TopType.anime, subtype: subtype ?? null, page: pageIndex + 1)
            .then((list) => list.take(10).toList()));
    return PagewiseListView(
      itemBuilder: (context, anime, index) => AnimeListCard(
        top: anime,
      ),
      scrollDirection: Axis.horizontal,
      pageLoadController: _pageController,
    );
  }
}
