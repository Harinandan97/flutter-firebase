import 'package:flutter/material.dart';

import '../explore click/click.dart';
void main(){
  runApp(MaterialApp(home: Karnatakaa(),));
}

class Karnatakaa extends StatefulWidget {
  const Karnatakaa({super.key});

  @override
  State<Karnatakaa> createState() => _Karnatakaa();
}

class _Karnatakaa extends State<Karnatakaa> {
  final List<Map<String,dynamic>> places=[

    {
      'image': 'assets/images/mysoorpalace.jpg',
      'title': 'Mysurupalace',
      'location': 'Mysoor,Karnataka,india',
      'About': 'the skyline of Mysuru ',

    },
    {
      'image': 'assets/images/Bengaluru.jpg',
      'title': 'Bengaluru',
      'location': 'Bengaluru,Karnataka,india',
      'About': 'historical sites and IT',

    },
    {
      'image': 'assets/images/Nagarahole Tiger Reserve.jpg',
      'title': 'Nagarahole Tiger Reserve',
      'location': 'Mysore&Kodagu,Karnataka,india',
      'About': 'wildlife',

    },
    {
      'image': 'assets/images/chickmagloor.jpg',
      'title': 'Chikkamagaluru',
      'location': 'Chikkamagaluru,Karnataka,india',
      'About': ' natural beauty & trekking'
      ,

    },
    {
      'image': 'assets/images/Hampi.jpg',
      'title': 'Hampi',
      'location': 'Vijayanagara,Karnataka,india',
      'About': 'UNESCO World Heritages '
      ,

    },
    {
      'image': 'assets/images/Nandi Hills.jpg',
      'title': 'Nandi Hills',
      'location': 'Chikkaballapur ,Karnataka,india',
      'About': 'stunning natural beauty'
      ,

    },
    {
      'image': 'assets/images/Murdeshwar.jpeg',
      'title': 'Murdeshwar National Park',
      'location': 'Uttara Kannada,Karnataka,india',
      'About': '2ndlargest Shivastatue'
      ,

    },
    {
      'image': 'assets/images/ISKCON Temple.jpg',
      'title': 'ISKCON Temple',
      'location': 'Bengaluru,Karnataka,india',
      'About': 'spiritual ambiance'
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
