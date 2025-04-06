import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ChatListPage()));
}

class ChatListPage extends StatelessWidget {
  final List<Map<String, dynamic>> chatList = [
    {
      'name': 'Sreerav',
     // 'message': 'Hey, is your place available?',
      'time': '10:30 AM',
      'image': 'assets/images/sree.jpeg',
    },
    {
      'name': 'Abhi',
     // 'message': 'Booking confirmed!',
      'time': 'Yesterday',
      'image': 'assets/images/abi.jpeg',
    },
    {
      'name': 'Sharan',
     // 'message': 'You can check in earlier.',
      'time': '2 days ago',
      'image': 'assets/images/sharan.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          var chat = chatList[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(chat['image']),
            ),
            title: Text(chat['name'], style: TextStyle(fontWeight: FontWeight.bold)),
           // subtitle: Text(chat['message'], maxLines: 1, overflow: TextOverflow.ellipsis),
            trailing: Text(chat['time'], style: TextStyle(color: Colors.grey)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(name: chat['name'], image: chat['image']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
  final String name;
  final String image;

  ChatPage({required this.name, required this.image});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  List<Map<String, String>> messages = [
    {'message': 'Hello! How can I help you?', 'sender': 'Hotel'},
    {'message': 'I want to book a room for tomorrow.', 'sender': 'Customer'},
  ];

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        messages.add({'message': _messageController.text, 'sender': 'Customer'});
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.image),
            ),
            SizedBox(width: 10),
            Text(widget.name),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                var message = messages[index];
                bool isMe = message['sender'] == 'Customer';
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.blue : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(message['message']!),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blue),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
