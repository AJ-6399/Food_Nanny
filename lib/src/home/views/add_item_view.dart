import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:to_do_app/chef_login.dart';
import '../home.dart';
import '../controllers/home_controller.dart';

class AddItemView extends GetView<HomeController> {
  AddItemView({Key? key}) : super(key: key);

  final nameCtrl = TextEditingController();
  final catCtrl = TextEditingController();
  final indCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final imageCtrl = TextEditingController();

  Future<void> addFoodLive() async {
    final data = FirebaseFirestore.instance.collection('all_food_items').add({
      'cookName': currCook.toString(),
      'cookPlace': currCookPostcode.toString(),
      'foodIngredients': indCtrl.text.toString(),
      'foodPrice': priceCtrl.text.toString(),
      'foodTitle': nameCtrl.text.toString(),
      'orderStatus': false,
    });
    await data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item $currCook'),
      ),
      body: Container(
        padding: EdgeInsets.all(34),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.red[300],
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: TextFormField(
                  controller: nameCtrl,
                  decoration: InputDecoration(
                      hintText: 'Name', border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.red[300],
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: TextFormField(
                  controller: indCtrl,
                  decoration: InputDecoration(
                      hintText: 'Ingredients', border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.red[300],
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: TextFormField(
                  controller: priceCtrl,
                  decoration: InputDecoration(
                      hintText: 'Price', border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 52,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                  print('item saved');
                  addFoodLive();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeView()));
                },
                child: Text('Save Item'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
