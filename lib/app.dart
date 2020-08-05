import 'package:cst407_assignment_3/screens/signin.dart';
import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'auth/auth_methods.dart';
import 'screens/detailscreen.dart';
import 'screens/favoriteanime.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),     
       routes: {
        '/home': (context) => Home(),
        '/detail': (context) => AnimeDetails(),
        '/favorites': (context) => FavoriteAnime(),
      },
    );
  }
}