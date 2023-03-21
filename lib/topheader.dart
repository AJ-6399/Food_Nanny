import 'package:flutter/material.dart';
class TopHeader extends StatefulWidget {
  const TopHeader({Key? key}) : super(key: key);

  @override
  State<TopHeader> createState() => _TopHeaderState();
}

class _TopHeaderState extends State<TopHeader> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Row(
          children: const [
            Icon(Icons.menu,color: Colors.white,),
            SizedBox(width: 10,),
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('images/dp.jpg'),
            ),
            SizedBox(width: 220),
            Icon(Icons.shopping_cart,color: Colors.red,)

          ],
        ),
      ),
    );
  }
}
