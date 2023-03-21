//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserChoice extends StatefulWidget {
  const UserChoice({Key? key}) : super(key: key);

  @override
  State<UserChoice> createState() => _UserChoiceState();
}

class _UserChoiceState extends State<UserChoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('images/food2.jpg'),
          fit:BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black45,BlendMode.darken),
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 140),
                  Text('Im a,',style:GoogleFonts.dangrek(color: Colors.blueGrey,fontSize:80),
                  ),
                const SizedBox(height:50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                     //padding: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                      image: const DecorationImage(image: AssetImage('images/consumer logo.png'),scale: 25),
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                    padding:EdgeInsets.symmetric(horizontal: 110),
                    child: TextField(
                    decoration: InputDecoration(
                    //hintText:'Consumer',
                    border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                ),
                const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                     //padding: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                      image: const DecorationImage(image: AssetImage('images/chef.png'),scale: 25),
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    ),
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}
