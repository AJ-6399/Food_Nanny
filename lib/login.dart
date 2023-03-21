import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:to_do_app/_registration.dart';
import 'package:to_do_app/userpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final textController = TextEditingController();
  final pswrdController = TextEditingController();

  void login(String email,password)async {
    try{
      showDialog(context: context, builder: (context){
        return const Center(
          child: CircularProgressIndicator(color: Colors.red,),
        );
      }
      );
      Response response=await post(
          Uri.parse('https://ofop.azurewebsites.net/api/User/login'),
          body:jsonEncode({
            "username": email,
            "password": password
          }),
          headers: {
            "Accept": "application/json",
            "content-type":"application/json"
          }
      );
      if(response.statusCode==200)
      {
        print("user created");
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UserPage(),
            ));
      }
      else{
        print(response.statusCode);
      }
    }
    catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/dark2.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        )),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ), //sized box can be used for spacing
                const Icon(
                  Icons.lock,
                  size: 100,
                  color: Colors.green,
                ),
                const SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    decoration: BoxDecoration(
                      //mandatory
                      color: Colors.white54, //container colour
                      borderRadius:
                          BorderRadius.circular(15), //rounding corners
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left:
                              20), //edgeinset.only() for alignment of text inside input
                      child: TextField(
                        controller: textController,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left:
                              20), //edgeinset.only() for alignment of text inside input
                      child: TextField(
                        obscureText: true,
                        controller: pswrdController,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25), //padding outside container
                  child: InkWell(
                    onTap: () {
                    login(textController.text.toString(),pswrdController.text.toString());
                    },
                    child: Container(
                      padding:
                          const EdgeInsets.all(13), // padding inside container
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not a member?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ClientRegistration(),
                            ));
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
