import 'package:firebasenew/travel/screens/settingsairbnb.dart';
import 'package:firebasenew/travel/screens/wishd.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../theme/controller/themecontrollertravel.dart';
import '../theme/themedata/themedatatravell.dart';
import 'firebasebookeddata.dart';
import 'login.dart';

void main() {
  runApp(MaterialApp(home: ProfilePage()));
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  String? userName;
  String? userEmail;

  @override
  void initState() {
    super.initState();
    _fetchUserInfo();
  }

  void _fetchUserInfo() {
    user = _auth.currentUser;

    if (user != null) {
      userEmail = user!.email ?? "No Email Available";


      if (userEmail != null && userEmail!.contains('@')) {
        userName = userEmail!.split('@')[0];
      } else {
        userName = "No Name Available";
      }

      setState(() {});
    }
  }
  final HomeCntroller _controller =Get.put(HomeCntroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(fontWeight: FontWeight.bold)),actions: [


      ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Picture & Name
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/images (5).jpeg"),
                  ),
                  SizedBox(height: 10),
                  Text(userName ?? "Loading...", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Text(userEmail ?? "Loading...", style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.edit, size: 16),
                    label: Text("Edit Profile"),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BookingHistory()));
              },
              child: Text('Booking History', style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
              },
              child: Text('Settings', style: TextStyle(color: Colors.black)),
            ),
            Obx(
                    ()=>Switch(value: _controller.currentTheme.value==ThemeMode.dark, onChanged: (value){
                  _controller.switchTheme();
                  Get.changeThemeMode(_controller.currentTheme.value);

                },
                  activeColor: CustomTheme.white,
                )),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton.icon(
                onPressed: () async {
                  try{
                    await _auth.signOut();

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    print("user log out successfully");
                  }
                  catch(e){
                    print("Error logging out: $e");
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error logging out. Please try again.')),);

                  }
                },
                icon: Icon(Icons.logout),
                label: Text("Logout"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }


}
