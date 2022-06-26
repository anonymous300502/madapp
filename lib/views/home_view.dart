// ignore_for_file: avoid_print, curly_braces_in_flow_control_structures, prefer_const_constructors, dead_code

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/views/login_view.dart';
import 'package:flutter_application_1/views/main_ui.dart';
import 'package:flutter_application_1/views/verify_email_view.dart';

import '../firebase_options.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            print(FirebaseAuth.instance.currentUser);
            if (user != null) {
              if (user.emailVerified) {
                return mainui();
              } else {
                return VerifyEmailView();
              }
            } else {
              return LoginView();
            }
            return const Text("done");
          //   print(user);
          //   if (user?.emailVerified ?? false) {
          //     print("Email verified");
          //   } else {
          //     return Text("done");
          //   }
          default:
            return Text("HELLO");
        }
      },
    );
  }
}
