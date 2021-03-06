import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/routes.dart';
import 'package:flutter_application_1/firebase_options.dart';

import '../utilities/show_error_dialog.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  String error = " ";

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LOGIN')),
      body: Column(children: [
        TextFormField(
          autocorrect: false,
          decoration: InputDecoration(hintText: "Enter your email here"),
          controller: _email,
        ),
        TextFormField(
          autocorrect: false,
          obscureText: true,
          decoration: InputDecoration(hintText: "Enter your password here"),
          controller: _password,
        ),
        ElevatedButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              try {
                final credential = await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: email, password: password);
                Navigator.of(context).pushNamedAndRemoveUntil(
                  homeroute,
                  (route) => false,
                );
                // ignore: avoid_print
                print(credential);
              } on FirebaseAuthException catch (e) {
                // ignore: avoid_print
                showErrorDialog(context, e.code);
                print(e.code);
              }
            },
            child: Text("LOGIN")),
        // ignore: avoid_unnecessary_containers
        Container(
          child: Text(error),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                Registerroute,
                (route) => false,
              );
            },
            child: Text('Not registered yet? register here'))
      ]),
    );
  }
}
