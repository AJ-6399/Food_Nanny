import 'package:flutter/material.dart';
import 'package:to_do_app/CartPage.dart';
import 'package:to_do_app/user_choice.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            Icon(
              Icons.menu,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 17,
              backgroundImage: AssetImage('images/profileicon.png'),
            ),
            SizedBox(width: 180),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage()));
                },
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.red,
                )),
            SizedBox(
              width: 20,
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserChoice()));
                },
                child: Icon(
                  Icons.logout,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
