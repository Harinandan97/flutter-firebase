import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'helperfire.dart';
import 'nflogin.dart';

class fhome extends StatelessWidget {
  final String email;
  fhome({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 400,),
          Center(child: Text("WELCOME $email",
          style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue) ,
          )),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: (){
            firehelper().signout().then((v){
              Get.to(flgp());
            });
          }, child: Text("logout")),

        ],
      ),
    );
  }
}