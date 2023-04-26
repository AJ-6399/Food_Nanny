import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/src/home/views/add_item_view.dart';
import '../home.dart';

class MenuView extends GetView<HomeController> {
  MenuView({Key? key}) : super(key: key);
  String? foodtitle;
  String? foodPrice;
  String? foodingredients;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('all_food_items')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  print('has data');
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        foodtitle = snapshot.data!.docs[index]['foodTitle'];
                        foodPrice = snapshot.data!.docs[index]['foodPrice'];
                        foodingredients =
                            snapshot.data!.docs[index]['foodIngredients'];
                        return Card(
                          child: ListTile(
                            title: Text(foodtitle!,
                                style: GoogleFonts.amaranth(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontSize: 24)),
                            leading: const CircleAvatar(
                              radius: 28,
                              backgroundImage: AssetImage('images/french.jpg'),
                            ),
                            trailing: Text(
                              foodPrice!,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
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
      ),
    );
  }
}
