import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/routes.dart';
import 'package:flutter_application_1/views/home_view.dart';
import 'package:flutter_application_1/views/login_view.dart';
import 'package:flutter_application_1/views/register_view.dart';
import 'package:flutter_application_1/views/verify_email_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "hello flutter",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomePage(),
        routes: {
          '/login/': ((context) => LoginView()),
          '/register/': ((context) => RegisterView()),
          '/home/': (context) => HomePage(),
          '/verify/': (context) => const VerifyEmailView()
        });
  }
}
