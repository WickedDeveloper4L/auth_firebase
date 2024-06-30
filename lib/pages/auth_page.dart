import 'package:auth_firebase/pages/homepage.dart';
import 'package:auth_firebase/pages/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //if the user is logged in
          if (snapshot.hasData) {
            return Homepage();
          }

          //if there no user
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
