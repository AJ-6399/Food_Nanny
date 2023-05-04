import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/backend/showfood.dart';
import 'package:to_do_app/src/app.dart';
import 'package:to_do_app/toppicks.dart';
import 'package:to_do_app/user_login.dart';
import 'package:to_do_app/variables.dart';

class OrderView extends StatelessWidget {
  final String custName;
  final String custPostcode;
  final String custPhone;
  final String foodTitle;
  OrderView(this.foodTitle, this.custName, this.custPostcode, this.custPhone);

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
                  image: AssetImage('images/european.jpg'),
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
                            child: const Icon(
                              CupertinoIcons.back,
                              color: Colors.red,
                            )),
                      ),
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
                  child: Text(foodTitle,
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
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Order details',
                    style: GoogleFonts.amaranth(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 340,
                    height: 120,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              Icon(
                                Icons.account_box,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Customer name :',
                                style: GoogleFonts.amaranth(fontSize: 18),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(custName,
                                  style: GoogleFonts.amaranth(
                                    fontSize: 15,
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              Icon(
                                Icons.account_box,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Customer Postcode :',
                                style: GoogleFonts.amaranth(fontSize: 18),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(custPostcode,
                                  style: GoogleFonts.amaranth(
                                    fontSize: 15,
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              Icon(
                                Icons.phone_android_outlined,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Customer phone :',
                                style: GoogleFonts.amaranth(fontSize: 18),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(custPhone,
                                  style: GoogleFonts.amaranth(
                                    fontSize: 15,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
