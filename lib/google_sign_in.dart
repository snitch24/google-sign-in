import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user; //Private property of class

  GoogleSignInAccount get user => _user!;

  Future googlelogin() async {
    final googleUser = await googleSignIn
        .signIn(); //method which will show the account selection screen
    if (googleUser == null) {
      //If user is null we return
      return;
    } else {
      _user = googleUser; //Else we store user id as user property of this class
    }

    final googleAuth =
        await googleUser.authentication; //will authenticate the user

    final credential = GoogleAuthProvider.credential(
      //Collect credentials like accesstoken and idtoken from the email id not the password
      idToken: googleAuth.idToken, //Then sign in using google firebase auth
      accessToken: googleAuth.accessToken,
    );

    await FirebaseAuth.instance
        .signInWithCredential(credential); //For the firebase login
    notifyListeners(); //To Update UI
  }

  Future logOut() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
