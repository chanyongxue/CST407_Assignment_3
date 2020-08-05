import 'package:cst407_assignment_3/state/homestate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../cards/topanimelist.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import '../state/homestate.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stateOwner = ProviderStateOwner();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Anime App"),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: Consumer((context, watch) {
              final index = watch(selectedIndex).state;
              return GNav(
                  gap: 8,
                  activeColor: Colors.white,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  duration: Duration(milliseconds: 200),
                  tabBackgroundColor: Colors.grey[800],
                  tabs: [
                    GButton(
                      icon: LineIcons.home,
                      text: 'Home',
                      onPressed: () => Navigator.pushNamed(context, '/home'),
                    ),
                    GButton(
                      icon: LineIcons.heart_o,
                      text: 'Likes',
                      onPressed: () => Navigator.pushNamed(context, '/favorites'),
                    ),
                    GButton(
                      icon: LineIcons.search,
                      text: 'Search',
                      //onPressed: () => Navigator.pushNamed(context, '/search'),
                    ),
                    GButton(
                      icon: LineIcons.user,
                      text: 'Profile',
                      //onPressed: () => Navigator.pushNamed(context, '/profile'),
                    ),
                  ],
                  selectedIndex: index,
                  onTabChange: (index) {
                    selectedIndex.read(context).state = index;
                  });
            }),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Divider(
            height: 20,
            color: Colors.transparent,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(23, 0, 10, 0),
            child: Text(
              "Popular Anime",
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
            child: Text(
              "Top Anime Movies",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 270,
            padding: EdgeInsets.fromLTRB(13, 0, 20, 0),
            child: TopAnimeList(
              subtype: TopSubtype.movie,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(23, 0, 10, 0),
            child: Text(
              "Specials",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 270,
            padding: EdgeInsets.fromLTRB(13, 0, 20, 0),
            child: TopAnimeList(
              subtype: TopSubtype.special,
            ),
          ),
        ],
      ),
    );
  }
}
