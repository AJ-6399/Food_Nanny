import 'dart:core';
import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/backend/add_food.dart';
import 'package:to_do_app/backend/showfood.dart';
import 'package:to_do_app/foodredirect.dart';
import 'package:to_do_app/toppicks.dart';

import '../chef_login.dart';
import '../user_login.dart' as currUser;

class CartItems extends StatefulWidget {
  const CartItems({super.key});

  @override
  State<CartItems> createState() => _CartItemsState();
}

String? cartCustName;
String? cartCustPhn;
String? cartCustPlace;
String? cartCustPostcode;
String? foodTitle;
String? foodPrice;
String? foodIngredients;
String? cookNames;
int totals = 0;
int cap = 0;
List<String> order_custName = [];
List<String> order_custAddress = [];
List<String> order_custPhone = [];
List<String> order_custPostcode = [];
List<String> order_foodTitle = [];
List<String> order_foodPrice = [];
List<String> cooks_name = [];
List<int> foodTot = [0];

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('add_to_cart')
              .doc(currUser.currUser)
              .collection('cartitems')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              print('has data');
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    cartCustName = snapshot.data!.docs[index]['custName'];
                    cartCustPhn = snapshot.data!.docs[index]['custPhone'];
                    cartCustPlace = snapshot.data!.docs[index]['custPlace'];
                    cartCustPostcode =
                        snapshot.data!.docs[index]['custPostcode'];
                    foodTitle = snapshot.data!.docs[index]['foodTitle'];
                    foodIngredients =
                        snapshot.data!.docs[index]['foodIngredients'];
                    foodPrice = snapshot.data!.docs[index]['foodPrice'];
                    cookNames = snapshot.data!.docs[index]['cook'];
                    totals = totals + int.parse(foodPrice!);
                    if (cap < snapshot.data!.docs.length) {
                      order_custName.add(cartCustName!);
                      order_custPhone.add(cartCustPhn!);
                      order_custAddress.add(cartCustPlace!);
                      order_foodTitle.add(foodTitle!);
                      order_custPostcode.add(cartCustPostcode!);
                      order_foodPrice.add(foodPrice!);
                      cooks_name.add(cookNames!);
                      foodTot.add(totals);
                      cap++;
                    }

                    return Card(
                      child: ListTile(
                        title: Text(foodTitle!,
                            style: GoogleFonts.amaranth(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 24)),
                        subtitle: Text(
                          foodIngredients!,
                          style: TextStyle(fontSize: 12),
                        ),
                        leading: const CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage('images/french.jpg'),
                        ),
                        trailing: Text('X1'),
                        onTap: () {},
                      ),
                    );
                  });
            } else {
              print('error');
              return Center(
                  child: Container(
                      child: Text(
                'No items to display',
                style: GoogleFonts.amaranth(
                  fontSize: 14,
                ),
              )));
            }
          },
        ),
      ),
    );
  }
}
