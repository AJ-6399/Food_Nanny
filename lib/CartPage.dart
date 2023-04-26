import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:to_do_app/toppicks.dart';
import 'package:to_do_app/userpage.dart';
import 'backend/showfood.dart';
import 'backend/view_cart.dart';
import 'backend/view_cart.dart' as totals;
import 'backend/view_cart.dart' as cookNames;
import 'chef_login.dart';
import 'foodredirect.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

String? fTitle;
String? fIngredients;
String? fPrice;
String confirmtxt = "Confirm";

class _CartPageState extends State<CartPage> {
  Future<void> addOrder() async {
    int len = order_custName.length;
    for (int i = 0; i < len; i++) {
      final data = FirebaseFirestore.instance
          .collection('chef_orders')
          .doc(cooks_name[i])
          .collection('cheforders')
          .add({
        'cookName': cooks_name[i],
        'custName': order_custName[i],
        'custAddress': order_custAddress[i],
        'custPhone': order_custPhone[i],
        'custPostcode': order_custPostcode[i],
        'foodTitle': order_foodTitle[i],
      });
      await data;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.only(top: 30, left: 10),
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
                ),
                Divider(
                  color: Colors.black,
                  thickness: 12,
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(height: 535, child: const CartItems()),
            Container(
              padding: EdgeInsets.only(right: 5),
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.currency_pound,
                          size: 22,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          foodTot[foodTot.length - 1].toString(),
                          style: GoogleFonts.amaranth(
                              color: Colors.white, fontSize: 35),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: InkWell(
                      onTap: () {
                        addOrder();
                        print('order added');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            action: SnackBarAction(
                              label: '',
                              onPressed: () {},
                            ),
                            content: const Text('Order Succesfull'),
                            duration: const Duration(milliseconds: 4500),
                            width: 280.0, // Width of the SnackBar.
                            padding: const EdgeInsets.symmetric(
                              horizontal:
                                  8.0, // Inner padding for SnackBar content.
                            ),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => UserPage())));
                      },
                      child: Container(
                        width: 130,
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                            child: Text(
                          confirmtxt,
                          style: GoogleFonts.amaranth(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
