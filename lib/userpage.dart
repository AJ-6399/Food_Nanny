import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/backend/showfood.dart';
import 'package:to_do_app/location.dart';
import 'package:to_do_app/topheader.dart';
import 'package:to_do_app/user_login.dart';
import 'package:to_do_app/usersearchbar.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [TopHeader(), UserLocation()],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const UserSearch(),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                'Top Picks for $currUser',
                style: GoogleFonts.amaranth(
                    fontSize: 27, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(height: 370, child: ShowFood()),
          ]),
        ),
      ),
    );
  }
}
