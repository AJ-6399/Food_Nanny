import 'package:flutter/material.dart';

class FoodDish extends StatefulWidget {
  const FoodDish({Key? key}) : super(key: key);

  @override
  State<FoodDish> createState() => _FoodDishState();
}

class _FoodDishState extends State<FoodDish> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Center(
            child: Container(
              color: Colors.black45,
            ),
          )

        ],
      ),
    );
  }
}
