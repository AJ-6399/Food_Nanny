import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:to_do_app/src/home/controllers/home_controller.dart';
import 'package:to_do_app/user_choice.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(HomeController());
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
