import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:to_do_app/JSONTEST/jsonapicall.dart';
import 'package:to_do_app/toppicks.dart';

class FetchMenu extends StatefulWidget {
  const FetchMenu({super.key});

  @override
  State<FetchMenu> createState() => _FetchMenuState();
}

int? number = postId;
String? emailUser = userEmail;

class _FetchMenuState extends State<FetchMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: fetchTopPicks(),
    );
  }

  fetchTopPicks() {
    return ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          int num = index + 1;
          getJsonData(num);
          number = postId;
          emailUser = userEmail;
          return const TopPicks();
        });
  }
}
