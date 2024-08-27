import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gtown_deals/auth/login_page.dart';
import 'package:gtown_deals/home_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Something Went Wrong!!!"),
            );
          } else {
            if (snapshot.data == null) {
              return const LoginPage();
            } else {
              return const HomePage();
            }
          }
        },
      ),
    );
  }
}
