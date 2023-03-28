import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/JSONTEST/jsonapicall.dart';
import 'package:to_do_app/fetchMenu.dart';
import 'package:to_do_app/getmenuapicall.dart';
import 'foodpage.dart';

class TopPicks extends StatefulWidget {
  const TopPicks({Key? key}) : super(key: key);

  @override
  State<TopPicks> createState() => _TopPicksState();
}

class _TopPicksState extends State<TopPicks> {
  @override
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FoodPage(),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 17),
        child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('images/biryani.jpg'),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        number.toString(),
                        style: GoogleFonts.amaranth(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 25),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 45,
                        width: 160,
                        child: Text(
                          emailUser.toString(),
                          style: GoogleFonts.amaranth(fontSize: 13),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: Text(
                              number.toString(),
                              style: GoogleFonts.amaranth(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
