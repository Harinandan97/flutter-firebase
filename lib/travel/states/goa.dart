import 'package:flutter/material.dart';

import '../explore click/click.dart';
void main(){
  runApp(MaterialApp(home: Goaa(),));
}

class Goaa extends StatefulWidget {
  const Goaa({super.key});

  @override
  State<Goaa> createState() => _Goaa();
}

class _Goaa extends State<Goaa> {
  final List<Map<String,dynamic>> places=[

    {
      'image': 'assets/images/Dudhsagar Falls.webp',
      'title': 'Dudhsagar Falls',
      'location': 'Sonauli,Goa,india',
      'About': '3-streamed waterfal ',

    },
    {
      'image': 'assets/images/Aguada Fort.jpg',
      'title': 'Aguada Fort',
      'location': ' North Goa ,Goa,india',
      'About':'grand architecture',

    },
    {
      'image': 'assets/images/Baga Beach.jpg',
      'title': 'Baga Beach',
      'location': 'Bardez,Goa,india',
      'About': ' vibrant nightlife',

    },
    {
      'image': 'assets/images/Harvalem Waterfalls.jpg',
      'title': 'Harvalem Waterfalls',
      'location': 'Kudne,Goa,india',
      'About': 'Natural beauty'
      ,

    },
    {
      'image': 'assets/images/Reis Magos Fort.webp',
      'title': 'Reis Magos Fort',
      'location': 'Goa,india',
      'About': 'bastions of Portuguese'
      ,

    },
    {
      'image': 'assets/images/Basilica of Bom Jesus.jpg',
      'title': 'Basilica of Bom Jesus',
      'location': 'Goa,india',
      'About': ' baroque architecture'
      ,

    },
    {
      'image': 'assets/images/Arambol Beach.jpg',
      'title': 'Arambol Beach',
      'location': 'Goa,india',
      'About': 'crystalclear waters'
      ,

    },
    {
      'image': 'assets/images/Chapora Fort.jpg',
      'title': 'Chapora Fort',
      'location': 'Goa,india',
      'About': 'spectacular views '
      ,

    },











  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: GestureDetector(onTap:(){

          } ,
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
              (crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8
            ), itemCount: places.length,
                itemBuilder: (context,index){
                  var place = places[index];

                  return
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius:  BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                            child: Image.asset(
                              place['image'],
                              height: 130,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),


                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  place['title'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 4),
                                Text(place['location'],
                                    style: TextStyle(color: Colors.grey[600])),
                                SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(place['About'],
                                        style: TextStyle(fontWeight: FontWeight.bold)),

                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                }),
          ),
        ),


      ],),
    );
  }
}
