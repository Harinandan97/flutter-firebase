import 'package:firebasenew/travel/screens/settingsairbnb.dart';
import 'package:firebasenew/travel/screens/wishd.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ProfilePage()));
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(fontWeight: FontWeight.bold)),
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
                  Text("Hari", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Text("hari@gmail.com", style: TextStyle(color: Colors.grey)),
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



          TextButton(onPressed: (){
            Navigator.push((context), MaterialPageRoute(builder: (context)=>wish()));
          }, child: Text('Booking Hisory',style: TextStyle(color: Colors.black),)),
            TextButton(onPressed: (){
              Navigator.push((context), MaterialPageRoute(builder: (context)=>SettingsPage()));
            }, child: Text('Settings',style: TextStyle(color: Colors.black),)),


            Divider(),


            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton.icon(
                onPressed: () {},
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


  Widget _buildProfileOption(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(title, style: TextStyle(fontSize: 16)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {

      },
    );
  }
}
