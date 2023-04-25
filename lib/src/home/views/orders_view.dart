import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/chef_login.dart';

import '../../../backend/showfood.dart';
import '../../../backend/view_cart.dart';
import '../home.dart';

class OrdersView extends GetView<HomeController> {
  OrdersView({Key? key}) : super(key: key);
  String? orderCustName;
  String? orderCustPhn;
  String? orderCustPostcode;
  String? orderFoodTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chef_orders')
            .doc('Ameya')
            .collection('cheforders')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            print(currCook);
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  orderCustName = snapshot.data!.docs[index]['custName'];
                  orderCustPhn = snapshot.data!.docs[index]['custPhone'];
                  orderCustPostcode =
                      snapshot.data!.docs[index]['custPostcode'];
                  orderFoodTitle = snapshot.data!.docs[index]['foodTitle'];
                  return Card(
                    child: ListTile(
                      title: Text(orderFoodTitle!,
                          style: GoogleFonts.amaranth(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 24)),
                      leading: const CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage('images/french.jpg'),
                      ),
                      trailing: Text('View'),
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
    );
  }
}
