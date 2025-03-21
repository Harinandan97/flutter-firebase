import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';

import 'examble/loginpage.dart';
import 'firebase_options.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );

  runApp(GetMaterialApp(home: Todoui(),));
}


class Todoui extends StatefulWidget {
  final cname = TextEditingController();
  final cemail = TextEditingController();


  @override
  State<Todoui> createState() => _TodouiState();
}

class _TodouiState extends State<Todoui> {


  late CollectionReference usercollection;




  bool

  isloading

  =

  true;

  @override
  void initState() {
    usercollection = FirebaseFirestore.instance.collection("note");

    super.initState();
    loaddata();
  }

  void loaddata() async {
    setState(() {
      isloading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        StreamBuilder<QuerySnapshot>
          (stream: readuser(), builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Erorr ${snapshot.error}"),);
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(),);
          }
          final users = snapshot.data!.docs;
          return
            ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                final userid = user.id;
                final userName = user["name"];
                final userEmail = user["email"];
                return Card(
                  child: ListTile(
                    title: Text("$userName", style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),),
                    subtitle: Text("$userEmail", style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),),
                    trailing: Wrap(
                      children: [
                        IconButton(onPressed: () {
                          uname.text = userName;
                          uemail.text = userEmail;
                          edituser(userid);
                        }, icon: Icon(Icons.edit)),
                        IconButton(onPressed: () {
                          deleteuser(userid);
                        }, icon: Icon(Icons.delete)),

                      ],
                    ),
                  ),
                );
              },);
        })


        ,
        floatingActionButton: FloatingActionButton(onPressed: () => adduser(),
          child: Icon(Icons.add),


        ));
  }

  final cname = TextEditingController();
  final cemail = TextEditingController();

  void adduser() {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("add user."),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10,),
            TextField(
              controller: cname,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Name"
              ),

            ),
            const SizedBox(height: 10,),
            TextField(
              controller: cemail,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Email"
              ),
            ),

          ],
        ),
        actions: [
          ElevatedButton(onPressed: () => addusertoDB(cname.text, cemail.text),
              child: Text("ctreate user"))
        ],
      );
    });
  }

  Future <void> addusertoDB(String name, String email) async {
    return usercollection.add({'name': name, 'email': email}).then((Value) {
      print("user added successfuly");
      cname.clear();
      cemail.clear();
      Navigator.of(context).pop();
    }).catchError((error) {
      print("faild to add $error");
    });
  }

  Stream<QuerySnapshot> readuser() {
    return usercollection.snapshots();
  }

  final uname = TextEditingController();
  final uemail = TextEditingController();

  void edituser(String  id) async {
    showModalBottomSheet(isScrollControlled: true,
        context: context, builder: (context) =>
            Container(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
                bottom: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom + 100,
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 20,),
                  TextField(
                    controller: uname,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "name"),
                  ),
                  SizedBox(height: 10,),

                  TextField(
                    controller: uemail,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "email"),
                  ),
                  SizedBox(height: 30,),

                  ElevatedButton(onPressed:()=> updateuser(id,uname.text,uemail.text),
                      child: Text("Update"))

                ],
              ),

            )
    );
  }

 Future<void> updateuser(String id,String uname,String uemail)async {
    var updatevalues={"email":uemail,"name":uname};
    return usercollection.doc(id).update(updatevalues).then((Value){
      Navigator.of(context).pop();
      print("user data updated successfully");

    });
 }
Future<void>deleteuser(var id)async{
    return usercollection.doc(id).delete().then((Value){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("user deleted successfully"))
      );
    }).catchError((Error){
      print("user deleted failed $Error");
    });

}


}
