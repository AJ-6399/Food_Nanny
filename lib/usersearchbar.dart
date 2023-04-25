import 'package:flutter/material.dart';

class UserSearch extends StatefulWidget {
  const UserSearch({Key? key}) : super(key: key);

  @override
  State<UserSearch> createState() => _UserSearchState();
}

class _UserSearchState extends State<UserSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 370,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(style: BorderStyle.solid, color: Colors.red),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.search_sharp,
            color: Colors.red,
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            width: 200,
            height: 50,
            child: const TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'What do you want today?'),
            ),
          ),
        ],
      ),
    );
  }
}
