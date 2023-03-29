import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_app/backend/add_food.dart';
import 'package:to_do_app/getmenuapicall.dart';
import 'package:to_do_app/toppicks.dart';

class ShowFood extends StatefulWidget {
  const ShowFood({super.key});

  @override
  State<ShowFood> createState() => _ShowFoodState();
}

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
              print('has data called');
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    foodTitle = snapshot.data!.docs[index]['foodTitle'];
                    foodIngredients =
                        snapshot.data!.docs[index]['foodIngredients'];
                    foodPrice = snapshot.data!.docs[index]['foodPrice'];
                    print('has called');
                    print(snapshot.data?.docs.length);
                    return TopPicks();
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
