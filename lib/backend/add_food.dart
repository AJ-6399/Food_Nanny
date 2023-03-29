import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addFood() async {
  final data = FirebaseFirestore.instance.collection('all_food_items').add({
    'cookName': "Yamini",
    'cookPlace': "Telford",
    'foodIngredients': "Beef,BBQ Sauce,Rice",
    'foodPrice': 9,
    'foodTitle': "Beef Biryani",
    'orderStatus': false,
  });
  await data;
}
