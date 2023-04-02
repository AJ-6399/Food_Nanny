import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:to_do_app/user_login.dart';

class ChefRegistration extends StatefulWidget {
  const ChefRegistration({super.key});

  @override
  State<ChefRegistration> createState() => _ChefRegistrationState();
}

class _ChefRegistrationState extends State<ChefRegistration> {
  final username = TextEditingController();
  final mobile = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final address = TextEditingController();
  final postcode = TextEditingController();
  final passwordConfirm = TextEditingController();
  void register() async {
    try {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.red),
            );
          });
      Response response = await post(
          Uri.parse('https://ofopapi.azurewebsites.net/api/User/register'),
          body: jsonEncode({
            "custName": username.text.toString(),
            "custUsername": username.text.toString(),
            "custPassword": password.text.toString(),
            "custTelNumber": mobile.text.toString(),
            "custAddress": address.text.toString(),
            "custPostCode": postcode.text.toString(),
            "custEmail": email.text.toString(),
            "userType": 1
          }),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          });
      if (response.statusCode == 200) {
        print('user created');
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ));
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Chef Registration'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding:
              EdgeInsets.only(top: 25.0, right: 10.0, bottom: 25.0, left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextFormField(
                controller: username,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  hintText: 'Choose Username',
                  icon: Icon(Icons.person),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              TextFormField(
                controller: mobile,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  labelText: 'Enter Mobile Number',
                  hintText: 'Mobile Number',
                  icon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
              ),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  labelText: 'Enter Email ID',
                  hintText: 'Email ID',
                  icon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
              ),
              TextFormField(
                controller: address,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  labelText: 'Enter Address',
                  hintText: 'House No,Street',
                  icon: Icon(Icons.location_on),
                ),
                maxLines: 2,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
              ),
              TextFormField(
                controller: postcode,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter PostCode',
                  hintText: 'Postcode',
                  icon: Icon(Icons.home_work),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
              ),
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  hintText: 'Password',
                  icon: Icon(Icons.vpn_key),
                ),
                obscureText: true,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
              ),
              TextButton(
                child: Text(
                  'Register',
                ),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                  primary: Colors.white,
                  backgroundColor: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  register();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Successfull. Now Log in'),
                      duration: const Duration(milliseconds: 4500),
                      width: 280.0, // Width of the SnackBar.
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, // Inner padding for SnackBar content.
                      ),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
