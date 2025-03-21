import 'package:flutter/material.dart';

class wish extends StatefulWidget {
  const wish({super.key});

  @override
  State<wish> createState() => _wishState();
}

class _wishState extends State<wish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wishlist"),actions: [
        Icon(Icons.menu)
      ],),
      body: Column(
        children: [
          Center(
            child: Card(
              child: Text("NO items yet"),
            ),
          )
        ],
      ),
    );
  }
}
