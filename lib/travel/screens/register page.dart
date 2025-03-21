import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController namee=TextEditingController();
  TextEditingController eemail=TextEditingController();
  TextEditingController ppasword=TextEditingController();
  final FirebaseAuth auth=FirebaseAuth.instance;
  final FirebaseFirestore firestore =FirebaseFirestore.instance;

  GlobalKey<FormState>forme=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      /*appBar: AppBar(title: Center(child: Text("Sign Up")),
      ),*/
      body:
      Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/regg.webp"),fit: BoxFit.cover)
        ),child: Form(
        key: forme,
          child: Column(
          children: [
            SizedBox(height: 120,),
            TextFormField(
              controller: namee,
              decoration: InputDecoration(labelText: "Name",hintText: "Name",icon: Icon(Icons.person),
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(30)) ),
              validator: (name){
              if(name!.isEmpty){
                return "feields canot be empty";
              }else{
                return null;
              }
              },
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: eemail,
              decoration: InputDecoration(hintText: "email",labelText: "email",icon: Icon(Icons.email),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
              validator: (email){   if(email!.isEmpty||!email.contains("@")||!email.contains(".")){
                return"pls entre a valid user name ";
              }
              else{
                return null;
              }
              },
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: ppasword,
              decoration: InputDecoration(hintText: "password",labelText: "password",icon: Icon(Icons.password),
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)) ),
              validator: (password){
              if(password!.isEmpty){
                return 'password canot be empty';
              }else{
                return null;
              }
              },
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
var valid=forme.currentState!.validate();
if(valid){
  registerb();
}
            }, child: Text("Register"))
          ],
                ),
        ),

      ),


    );
  }

 Future <void> registerb() async{
    try{
      UserCredential userCredential=await auth.createUserWithEmailAndPassword(email: eemail.text.trim(), password: ppasword.text.trim());
      await firestore.collection("tuser").doc(userCredential.user!.uid).set({
        'name':namee.text.trim(),
        "email":eemail.text.trim(),
        'password':ppasword.text.trim(),
        'createAt':FieldValue.serverTimestamp()

      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Registration successful")));
      Navigator.pop(context);
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text("registration error: ${e.toString()}")));
    }

 }
}
