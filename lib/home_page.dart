import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learn/logged_in.dart';
import 'package:learn/sign_in.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Something Went Wrong!'),
            );
          } else if (snapshot.hasData) {
            return const LoggedInPage();
          } else {
            return const Scaffold(
              body: SigninPage(),
            );
          }
        });
  }
}
