import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/chef_login.dart';
import 'package:to_do_app/src/home/views/add_item_view.dart';
import '../home.dart';

class MenuView extends GetView<HomeController> {
  MenuView({Key? key}) : super(key: key);
  String? foodtitle;
  String? foodPrice;
  String? foodingredients;
  int c = 0;
  @override
  Widget build(BuildContext context) {
    final reference_data = FirebaseFirestore.instance
        .collection('chef_orders')
        .doc(currCook)
        .collection('active_menu');
    var data_id;
    List<String> id_list = [];
    dataDelete(int Index) {
      var doc_ref = id_list[Index];
      final is_Deleted = reference_data.doc(doc_ref).delete();
      id_list.removeAt(Index);
      return is_Deleted;
    }

    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: Container(
          height: 600,
          width: double.infinity,
          child: StreamBuilder(
            stream: reference_data.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                print('has data');
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      data_id = snapshot.data!.docs[index].id;
                      if (id_list.length <= snapshot.data!.docs.length) {
                        id_list.add(data_id);
                      }

                      print(id_list);
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
                            trailing: InkWell(
                              onTap: () {
                                dataDelete(index);
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            )),
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
