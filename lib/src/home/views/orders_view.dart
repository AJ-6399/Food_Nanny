import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/chef_login.dart';

import '../../../backend/showfood.dart';
import '../../../backend/view_cart.dart';
import '../home.dart';
import 'orderdetails.dart';

class OrdersView extends GetView<HomeController> {
  OrdersView({Key? key}) : super(key: key);
  String? orderCustName;
  String? orderCustPhn;
  String? orderCustPostcode;
  String? orderFoodTitle;
  List<String> custName = [];
  List<String> custPhn = [];
  List<String> custPostcode = [];
  List<String> foodTitle = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: 500,
          width: double.infinity,
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('chef_orders')
                .doc(currCook)
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
                      custName.add(orderCustName!);
                      custPhn.add(orderCustPhn!);
                      custPostcode.add(orderCustPostcode!);
                      foodTitle.add(orderFoodTitle!);
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
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderView(
                                        foodTitle[index],
                                        custName[index],
                                        custPostcode[index],
                                        custPhn[index])));
                          },
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
      ),
    );
  }
}
