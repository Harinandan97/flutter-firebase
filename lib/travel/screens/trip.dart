import 'package:flutter/material.dart';

import 'all.dart';
void main(){
  runApp(MaterialApp(home: trips(),));
}
class trips extends StatefulWidget {
  const trips({super.key});

  @override
  State<trips> createState() => _tripsState();
}

class _tripsState extends State<trips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Center(child: Text("Trips",style: TextStyle(fontWeight: FontWeight.bold),)),
      ),

      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(40),
          child: Text("No trips booked...yet!",style: TextStyle(fontWeight: FontWeight.bold),),

        ),SizedBox(height: 20,),
        ElevatedButton.icon(onPressed: (){
          Navigator.push((context), MaterialPageRoute(builder: (context)=>Alllocations()));
        }, label: Text("Start searching"),style:
          ElevatedButton.styleFrom(
            minimumSize: Size(40, 40),
          ),),
        Padding(
          padding: const EdgeInsets.all(40),
          child: Text("can't find your reservation here? "),
        )
      ],),
    );

  }
}
