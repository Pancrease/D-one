// ignore_for_file: file_names, unused_import, camel_case_types, library_private_types_in_public_api, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/menu.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'Google_sign_in.dart';

class Google_sign_in extends StatefulWidget {
  const Google_sign_in({super.key});

  @override
  _Google_sign_inState createState() => _Google_sign_inState();
}

class _Google_sign_inState extends State<Google_sign_in> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Sign in with Google'),
          onPressed: () async {
            try {
              final GoogleSignInAccount? googleUser =
                  await _googleSignIn.signIn();
              // ignore: unused_local_variable
              final GoogleSignInAuthentication? googleAuth =
                  await googleUser?.authentication;
              if (googleUser?.displayName != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Menu()),
                );
              }

              // Now that we have the user's Google account, we can use it to sign in to your own app
              // For example, you could use the Google account to sign in to Firebase
            } catch (error) {
              print(error);
            }
          },
        ),
      ),
    );
  }
}
