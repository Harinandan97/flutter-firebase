import 'package:flutter/material.dart';

import '../explore click/click.dart';
import 'keralamap.dart';
void main(){
  runApp(MaterialApp(home: kerala(),));
}

class kerala extends StatefulWidget {
  const kerala({super.key});

  @override
  State<kerala> createState() => _keralaState();
}

class _keralaState extends State<kerala> {
  final List<Map<String,dynamic>> places=[

    {
      'image': 'assets/images/kozikodu beach.jpg',
      'title': 'Kozhikode Beach',
      'location': 'Kozhikode,Kerala,india',
      'About': '  coastal destination ',

    },
    {
      'image': 'assets/images/kochi.jpeg',
      'title': 'Kochi',
      'location': 'Eranakulam,Kerala,india',
      'About': 'Queen of the Arabian Sea',

    },
    {
      'image': 'assets/images/Thiruvananthapuram.jpeg',
      'title': 'Thiruvananthapuram',
      'location': 'Thiruvananthapuram,Kerala,india',
      'About': ' rich cultural heritage',

    },
    {
      'image': 'assets/images/Munnar.jpeg',
      'title': 'Munnar',
      'location': 'Idukki,Kerala,india',
      'About': 'Virgin forests,rolling hills'
      ,

    },
    {
      'image': 'assets/images/wynad.jpg',
      'title': 'Wayanad',
      'location': 'Wayanad,Kerala,india',
      'About': ' wildlife sanctuaries '
      ,

    },
    {
      'image': 'assets/images/alappuzha.jpeg',
      'title': 'Kuttanadu',
      'location': 'Alappuzha,Kerala,india',
      'About': 'coir industry'
      ,

    },
    {
      'image': 'assets/images/periyar.jpg',
      'title': 'Periyar National Park',
      'location': 'Idukki,Kerala,india',
      'About': 'protected diverse forests'
      ,

    },
    {
      'image': 'assets/images/bekal.jpg',
      'title': 'Bekal',
      'location': 'Kasarkodu,Kerala,india',
      'About': ' a coastal town '
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
