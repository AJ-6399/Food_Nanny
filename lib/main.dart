import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:to_do_app/CartPage.dart';
import 'package:to_do_app/user_choice.dart';
import 'package:to_do_app/user_registration.dart';
import 'package:to_do_app/user_login.dart';
import 'package:to_do_app/userpage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ToDo());
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserChoice(),
    );
  }
}
