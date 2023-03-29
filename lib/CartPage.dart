import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/getmenuapicall.dart';
import 'package:http/http.dart' as http;
import 'package:to_do_app/toppicks.dart';

Future<String> getapicall() async {
  var result = await http.post(
      Uri.parse("https://ofopapi.azurewebsites.net/api/Menu/getMenuByMenuID"),
      body: jsonEncode({1}),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      });
  print(result.body);
  return result.body;
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(top: 30, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 37,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'Cart',
                  style: GoogleFonts.amaranth(
                      fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      )),
    );
  }
}
