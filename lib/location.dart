import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserLocation extends StatefulWidget {
  const UserLocation({Key? key}) : super(key: key);

  @override
  State<UserLocation> createState() => _UserLocationState();
}

class _UserLocationState extends State<UserLocation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 7),
            child: Text('Deliver to',style: GoogleFonts.amaranth(fontSize: 35,fontWeight:FontWeight.bold,color: Colors.white),),
          ),
              Container(
                  height: 50,
                  width: 200,
                  decoration:BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow:const [
                      BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 2,
                      blurRadius: 10,
                     offset: Offset(0,3),
                    )
                    ]
                  ),
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
                  children:  [const
                      Padding(
                       padding: EdgeInsets.only(left: 5),
                       child: Icon(Icons.location_on_outlined,color: Colors.red,),
                     ),const
                     SizedBox(width: 20,),
                    Text('Choose location',style: GoogleFonts.amaranth(color: Colors.red,fontSize: 15),)
                  ],
                ),
              ),

            ],
          ),


    );
  }
}
