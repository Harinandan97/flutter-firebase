import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MessagesPage()));
}

class MessagesPage extends StatelessWidget {
  final List<Map<String, dynamic>> messages = [
    {
      'name': 'Sreerav',
      'message': 'Hey  your place available',
      'time': '10:30 AM',
      'image': 'assets/images/sree.jpeg',
    },
    {
      'name': 'Abhi',
      'message': 'Booking conformed!',
      'time': 'Yesterday',
      'image': 'assets/images/abi.jpeg',
    },
    {
      'name': 'Sharan',
      'message': 'You Can  check in earlier',
      'time': '2 days ago',
      'image': 'assets/images/sharan.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          var chat = messages[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(chat['image']),
            ),
            title: Text(chat['name'], style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(chat['message'], maxLines: 1, overflow: TextOverflow.ellipsis),
            trailing: Text(chat['time'], style: TextStyle(color: Colors.grey)),
            onTap: () {

            },
          );
        },
      ),
    );
  }
}
