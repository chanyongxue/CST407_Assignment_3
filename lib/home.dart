import 'package:flutter/material.dart';
import 'topanimelist.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: Icon(EvaIcons.menu, color: Colors.white),
        title: Text("Anime App"),
        actions: <Widget>[
          IconButton(icon: Icon(EvaIcons.menuArrowOutline, color: Colors.white), onPressed: null)
        ],
      ),
      body: ListView(
        children: <Widget>[
          Divider(
            height: 20,
            color: Colors.transparent,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(23, 0, 10, 0),
          child: Text("Popular Anime",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          ),
          ),
          Container(
            height: 270,
            padding: EdgeInsets.fromLTRB(13, 0, 20, 0),
            child: TopAnimeList(),
          ),
           Padding(
            padding: EdgeInsets.fromLTRB(23, 0, 10, 0),
          child: Text("Top Anime Movies",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          ),
          ),
          Container(
            height: 270,
            padding: EdgeInsets.fromLTRB(13, 0, 20, 0),
            child: TopAnimeList(subtype: TopSubtype.movie,),
            ),
            Padding(
            padding: EdgeInsets.fromLTRB(23, 0, 10, 0),
          child: Text("Specials",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          ),
          ),
          Container(
            height: 270,
            padding: EdgeInsets.fromLTRB(13, 0, 20, 0),
            child: TopAnimeList(subtype: TopSubtype.special,),
            ),
        ],
      ),
    );
  }
}