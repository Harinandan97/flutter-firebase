import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'helperfire.dart';
import 'nflogin.dart';

class fregp extends StatefulWidget {
  const fregp({super.key});

  @override
  State<fregp> createState() => _fregpState();
}

class _fregpState extends State<fregp> {
  GlobalKey<FormState>formkey=GlobalKey();
  String? name;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key:formkey ,
        child: Column(
          children: [
            SizedBox(height: 60,),
            TextFormField(

              decoration: InputDecoration(hintText: "username",labelText: "username",border: OutlineInputBorder(borderRadius: BorderRadius.circular(3))

              ),
              validator: (username){
                if(username!.isEmpty){
                  return"username canot be empty ";
                }
                else{
                  return null;
                }
              },
              onSaved: (uname){
                name = uname;
              },
            ),
            SizedBox(height: 30,),
            TextFormField(

              decoration: InputDecoration(hintText: "email",labelText: "email",border: OutlineInputBorder(borderRadius: BorderRadius.circular(3)
              )

              ),
              validator: (email){
                if(email!.isEmpty){
                  return"email canot be empty ";
                }
                else{
                  return null;
                }
              },
              onSaved: (emaill){
                email = emaill;
              },
            ),
            SizedBox(height: 30,),
            TextFormField(

              decoration: InputDecoration(hintText: "password",labelText: "password",border: OutlineInputBorder(borderRadius: BorderRadius.circular(3))
              ),
              validator: (password){
                if(password!.isEmpty){
                  return"password canot be empty ";
                }
                else{
                  return null;
                }
              },
              onSaved: (pass){
                password = pass;
              },
            ),

            ElevatedButton(onPressed: (){
              if(formkey.currentState!.validate()){
                formkey.currentState!.save();
                firehelper().signup(mail: email!, password: password!).then((value){
                  if(value == null){
                    Get.to(flgp());
                  }
                  else{
                    Get.snackbar("error", value);
                  }
                });
              }


            }, child: Text("Register"))
          ],
        ),
      ),
    );
  }
}
