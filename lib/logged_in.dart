import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoggedInPage extends StatelessWidget {
  const LoggedInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Logged In')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Profile',
              style: TextStyle(fontSize: 24),
            ),
          ),
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(currentUser!.photoURL!),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Name: ${currentUser.displayName}',
            style: const TextStyle(fontSize: 21),
          ),
          Text(
            'email: ${currentUser.email}',
            style: const TextStyle(
              fontSize: 21,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
              provider.logOut();
            },
            child: const Text('Log Out'),
          ),
        ],
      ),
    );
  }
}
