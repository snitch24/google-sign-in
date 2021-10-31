import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn/google_sign_in.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Google Sign In'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googlelogin();
            }, //Calling the google SIgn in method to login
            icon: const FaIcon(
              FontAwesomeIcons.google,
              color: Colors.red,
            ),
            label: const Text('Tap Here to Sign in'),
          ),
        ],
      ),
    );
  }
}
