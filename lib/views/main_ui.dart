import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

enum MenuAction { logout }

class mainui extends StatefulWidget {
  const mainui({Key? key}) : super(key: key);

  @override
  State<mainui> createState() => _mainuiState();
}

class _mainuiState extends State<mainui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('main ui'),
        actions: [
          PopupMenuButton<MenuAction>(onSelected: (value) async {
            // await FirebaseAuth.instance.signOut();
            // Navigator.of(context)
            //     .pushNamedAndRemoveUntil('/login/', (route) => false);
            switch (value) {
              case MenuAction.logout:
                final shouldlogout = await showlogoutdialog(context);
                print(shouldlogout);
                if (shouldlogout == true) {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/login/', (route) => false);
                }

                break;
              default:
            }
          }, itemBuilder: (context) {
            return const [
              PopupMenuItem<MenuAction>(
                  value: MenuAction.logout, child: Text('Log Out')),
            ];
          })
        ],
      ),
    );
  }
}

Future<bool> showlogoutdialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Sign out"),
        content: Text("are you sure you want to sign out?"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("Cancel")),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text("Yes"))
        ],
      );
    },
  ).then((value) => value ?? false);
}
