import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:to_do_app/models/fetchtopPicks.dart';
import 'package:to_do_app/toppicks.dart';

class FetchMenu extends StatefulWidget {
  const FetchMenu({super.key});

  @override
  State<FetchMenu> createState() => _FetchMenuState();
}

class _FetchMenuState extends State<FetchMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: fetchTopPicks(),
    );
  }

  Widget fetchTopPicks() {
    return const TopPicks();
  }
}
