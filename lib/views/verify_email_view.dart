import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/routes.dart';

enum MenuAction { logout }

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("verify email"),
        actions: [
          // PopupMenuButton<MenuAction>(
          //   onSelected: (value) async {
          //     await FirebaseAuth.instance.signOut();
          //     Navigator.of(context).pushNamedAndRemoveUntil(
          //       Loginroute,
          //       (route) => false,
          //     );
          //   },
          //   itemBuilder: (context) {
          //     return const [
          //       PopupMenuItem<MenuAction>(
          //         value: MenuAction.logout,
          //         child: Text('Log Out'),
          //       )
          //     ];
          //   },
          // )
        ],
      ),
      body: Column(
        children: [
          const Text(
              "We've sent you a verification email. Please open it and click on the link to verify"),
          const Text("If you haven't recieved an email click on this button"),
          TextButton(
            onPressed: () async {
              final user = FirebaseAuth.instance.currentUser;
              await user?.sendEmailVerification();
            },
            child: const Text("verify"),
          ),
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                Registerroute,
                (route) => false,
              );
            },
            child: const Text("restart"),
          ),
        ],
      ),
    );
  }
}
