import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/backend/showfood.dart';
import 'package:to_do_app/foodpage.dart';
import 'package:to_do_app/src/app.dart';
import 'package:to_do_app/toppicks.dart';
import 'package:to_do_app/variables.dart';

class FoodRedirect extends StatelessWidget {
  final String menuPrice;
  final String menuTitle;
  final String menuIngredients;

  FoodRedirect(this.menuPrice, this.menuTitle, this.menuIngredients);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 350,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  )
                ],
                image: DecorationImage(
                  image: AssetImage('images/foodimagebg.jpg'),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.black54, BlendMode.darken),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 50),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            width: 55,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Icon(
                              CupertinoIcons.back,
                              color: Colors.red,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 213, top: 50),
                      child: Container(
                          width: 55,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Icon(
                            CupertinoIcons.cart,
                            color: Colors.red,
                          )),
                    ),
                  ],
                ),
                const Center(
                  child: CircleAvatar(
                    radius: 90,
                    backgroundImage: AssetImage('images/cb.jpg'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(menuTitle,
                      style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30)),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: double.infinity,
              height: 320,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 3,
                      blurRadius: 30,
                      offset: Offset(0, 20),
                    )
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 2,
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 25, right: 5),
                            child: Icon(
                              CupertinoIcons.star,
                              color: Colors.red,
                              size: 16,
                            ),
                          ),
                          Text(
                            '4.2',
                            style: GoogleFonts.amaranth(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10, right: 5),
                            child: Icon(
                              Icons.local_fire_department_outlined,
                              color: Colors.red,
                              size: 16,
                            ),
                          ),
                          Text(
                            '240 cal',
                            style: GoogleFonts.amaranth(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10, right: 5),
                            child: Icon(
                              CupertinoIcons.clock,
                              color: Colors.red,
                              size: 16,
                            ),
                          ),
                          Text(
                            '20-35 mins',
                            style: GoogleFonts.amaranth(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 280,
                    height: 90,
                    child: Text(
                        'Chicken Biryani is a savory chicken and rice dish that includes layers of chicken, rice, and aromatics that are steamed together.',
                        style: GoogleFonts.amaranth(
                          fontSize: 15,
                        )),
                  ),
                  Text(
                    'Ingredients',
                    style: GoogleFonts.amaranth(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 250,
                    height: 90,
                    child: Text(menuIngredients,
                        style: GoogleFonts.amaranth(
                          fontSize: 15,
                        )),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Icon(
                  Icons.currency_pound,
                  size: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 90),
                child: Text(
                  '$menuPrice',
                  style: GoogleFonts.amaranth(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 45),
                ),
              ),
              Container(
                width: 160,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        'Add',
                        style: GoogleFonts.amaranth(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(
                        CupertinoIcons.add,
                        color: CupertinoColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
