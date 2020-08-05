import 'package:cst407_assignment_3/auth/auth_methods.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  Signin({Key key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Sign in'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: RaisedButton(
            child: Text('Sign in as a Guest'),
            onPressed: () async {
              dynamic result = await _authMethods.signInAnonymously();
              if (result == null) {
                print('error');
              } else {
                print('Signed in');
                print(result.uid);
              }
            }),
      ),
    );
  }
}
