import 'package:flutter/material.dart';

import '../explore click/click.dart';
void main(){
  runApp(MaterialApp(home: Telanganaa(),));
}

class Telanganaa extends StatefulWidget {
  const Telanganaa({super.key});

  @override
  State<Telanganaa> createState() => _Telanganaa();
}

class _Telanganaa extends State<Telanganaa> {
  final List<Map<String,dynamic>> places=[

    {
      'image': 'assets/images/Charminar.webp',
      'title': 'Charminar',
      'location': 'Telangana,india',
      'About': ' Indo-Islamic architecture ',

    },
    {
      'image': 'assets/images/Golconda Fort.jpg',
      'title': 'Golconda Fort',
      'location': 'Telangana,india',
      'About': 'impressive architecture',

    },
    {
      'image': 'assets/images/Ramoji Film City.jpg',
      'title': 'Ramoji Film City',
      'location': 'Telangana,india',
      'About': 'worlds largest film studio',

    },
    {
      'image': 'assets/images/Hyderabad.jpg',
      'title': 'Hyderabad',
      'location': 'Telangana,india',
      'About': 'rich history'
      ,

    },
    {
      'image': 'assets/images/Mallela Thirtham Waterfall.jpg',
      'title': 'Mallela Thirtham Waterfall',
      'location': 'Telangana,india',
      'About': '  exquisite place '
      ,

    },
    {
      'image': 'assets/images/Nehru Zoological Park.jpg',
      'title': 'Nehru Zoological Park',
      'location': 'Telangana,india',
      'About': 'park'
      ,

    },
    {
      'image': 'assets/images/Kuntala Water Falls.jpg',
      'title': 'Kuntala Water Falls',
      'location': 'Telangana,india',
      'About': 'Natural beauty'
      ,

    },
    {
      'image': 'assets/images/Birla Mandir.jpg',
      'title': 'Birla Mandir',
      'location': 'Telangana,india',
      'About': 'white marble architecture '
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
