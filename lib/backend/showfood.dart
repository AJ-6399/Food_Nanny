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
import 'package:to_do_app/foodredirect.dart';
import 'package:to_do_app/variables.dart';
import 'package:to_do_app/toppicks.dart';
import '../foodpage.dart';

class ShowFood extends StatefulWidget {
  const ShowFood({super.key});

  @override
  State<ShowFood> createState() => _ShowFoodState();
}

String? foodTitle;
String? foodPrice;
String? foodIngredients;
const String fooditemTitle = "";

List<String> fooditemtitle = [];
List<String> fooditemPrice = [];
List<String> fooditemIngredients = [];

class _ShowFoodState extends State<ShowFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('all_food_items')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    foodTitle = snapshot.data!.docs[index]['foodTitle'];
                    foodIngredients =
                        snapshot.data!.docs[index]['foodIngredients'];
                    foodPrice = snapshot.data!.docs[index]['foodPrice'];
                    fooditemtitle.add(foodTitle!);
                    fooditemPrice.add(foodPrice!);
                    fooditemIngredients.add(foodIngredients!);
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
                          backgroundImage: AssetImage('images/biryani.jpg'),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FoodRedirect(
                                    fooditemPrice[index],
                                    fooditemtitle[index],
                                    fooditemIngredients[index]),
                              ));
                        },
                      ),
                    );
                  });
            } else {
              print('error');
              return Container();
            }
          },
        ),
      ),
    );
  }
}
