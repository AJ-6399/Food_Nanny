import 'package:flutter/material.dart';

import 'chef_sidebar.dart';

class ChefPage extends StatefulWidget {
  const ChefPage({Key? key}) : super(key: key);

  @override
  State<ChefPage> createState() => _ChefPageState();
}

class _ChefPageState extends State<ChefPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chef Page'),
      ),
      drawer: SidebarMenu(),
      body: Container(),
    );
  }
}
