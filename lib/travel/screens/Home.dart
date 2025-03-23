import 'package:firebase_core/firebase_core.dart';
import 'package:firebasenew/travel/screens/profile.dart';
import 'package:firebasenew/travel/screens/trip.dart';
import 'package:firebasenew/travel/screens/wishd.dart';
import 'package:firebasenew/travel/screens/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:firebasenew/travel/screens/wishlist.dart';
import 'package:firebasenew/travel/screens/wishlist.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import '../../firebase_options.dart';
import '../explore click/click.dart';
import 'message.dart';
import 'wishlist.dart';




import '../../task.dart';
import 'explore.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: home(),
  ));
}

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var screen=[

    Explore() ,wish(),trips (),MessagesPage(),ProfilePage()


  ];int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[index],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.black,
          backgroundColor: Colors.white,
          currentIndex: index,
          onTap: (tapindex){
            setState(() {
              index=tapindex;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.search,),label: "Explore"),
            BottomNavigationBarItem(icon: Icon(Icons.hotel,),label: "Booking"),
            BottomNavigationBarItem(icon: Icon(Icons.travel_explore,),label: "Trip"),
            BottomNavigationBarItem(icon: Icon(Icons.messenger,),label: "Messages"),
            BottomNavigationBarItem(icon: Icon(Icons.person,),label: "Profile"),
          ]),


    );
  }
}
