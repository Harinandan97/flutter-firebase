import 'package:firebase_core/firebase_core.dart';
import 'package:firebasenew/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'helperfire.dart';
import 'nfhome.dart';
import 'nfreg.dart';
void main()async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform
   );

 runApp(GetMaterialApp(home: flgp(),));
}
class flgp extends StatefulWidget {
  const flgp({super.key});

  @override
  State<flgp> createState() => _flgpState();
}

class _flgpState extends State<flgp> {
  GlobalKey<FormState>formekey1=GlobalKey();

  String? emaill;
  String? passwordd;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key: formekey1,
        child: Column(
          children: [
            Text("loginpage"),
            SizedBox(height: 30,),
            TextFormField(

              decoration: InputDecoration(hintText: "emaill",labelText: "Email",border: OutlineInputBorder(borderRadius: BorderRadius.vertical()
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
    onSaved: (email) {
      emaill = email;
    }
            ),
            SizedBox(height: 30,),
            TextFormField(

              decoration: InputDecoration(hintText: "password",labelText: "password"),

                validator: (password){
                  if(password!.isEmpty){
                    return"password canot be empty ";
                  }
                  else{
                    return null;
                  }
                },
                onSaved: (password) {
                  passwordd = password;
                }
            ),
            ElevatedButton(onPressed: (){
              if(formekey1.currentState!.validate()){
                formekey1.currentState!.save();

                firehelper().signin(mail: emaill!, pass: passwordd!).then((value){
                  if(value == null){
                    Get.offAll(fhome(email :emaill!));
                  }
                  else{
                    Get.snackbar("error", value);
                  }
                }

                );}
            }, child: Text("login")),
            TextButton(onPressed: (){
              Navigator.push((context),MaterialPageRoute(builder: (context)=>fregp()));
            }, child: Text("not a user"))
          ],
        ),
      ),
    );
  }
}
