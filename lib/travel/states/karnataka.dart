import 'package:flutter/material.dart';

import '../explore click/click.dart';
import 'allmaps.dart';
void main(){
  runApp(MaterialApp(home: Karnatakaa(),));
}

class Karnatakaa extends StatefulWidget {
  const Karnatakaa({super.key});

  @override
  State<Karnatakaa> createState() => _Karnatakaa();
}

class _Karnatakaa extends State<Karnatakaa> {
  final List<Map<String, dynamic>> places = [
    {
      'image': 'assets/images/mysoorpalace.jpg',
      'title': 'Mysore Palace',
      'location': 'Mysore, Karnataka, India',
      'About': 'The skyline of Mysuru',
      'lat': 12.3052,
      'lng': 76.6552,
    },
    {
      'image': 'assets/images/Bengaluru.jpg',
      'title': 'Bengaluru',
      'location': 'Bengaluru, Karnataka, India',
      'About': 'Historical sites and IT',
      'lat': 12.9716,
      'lng': 77.5946,
    },
    {
      'image': 'assets/images/Nagarahole Tiger Reserve.jpg',
      'title': 'Nagarahole Tiger Reserve',
      'location': 'Mysore & Kodagu, Karnataka, India',
      'About': 'Wildlife',
      'lat': 12.0846,
      'lng': 76.0522,
    },
    {
      'image': 'assets/images/chickmagloor.jpg',
      'title': 'Chikkamagaluru',
      'location': 'Chikkamagaluru, Karnataka, India',
      'About': 'Natural beauty & trekking',
      'lat': 13.3161,
      'lng': 75.7720,
    },
    {
      'image': 'assets/images/Hampi.jpg',
      'title': 'Hampi',
      'location': 'Vijayanagara, Karnataka, India',
      'About': 'UNESCO Heritage Site',
      'lat': 15.3350,
      'lng': 76.4600,
    },
    {
      'image': 'assets/images/Nandi Hills.jpg',
      'title': 'Nandi Hills',
      'location': 'Chikkaballapur, Karnataka, India',
      'About': 'Stunning natural beauty',
      'lat': 13.3702,
      'lng': 77.6835,
    },
    {
      'image': 'assets/images/Murdeshwar.jpeg',
      'title': 'Murdeshwar National Park',
      'location': 'Uttara Kannada, Karnataka, India',
      'About': '2nd largest Shiva statue',
      'lat': 14.0943,
      'lng': 74.4845,
    },
    {
      'image': 'assets/images/ISKCON Temple.jpg',
      'title': 'ISKCON Temple',
      'location': 'Bengaluru, Karnataka, India',
      'About': 'Spiritual ambiance',
      'lat': 13.0094,
      'lng': 77.5511,
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
            (crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8
          ), itemCount: places.length,
              itemBuilder: (context,index){
                var place = places[index];

                return
                  GestureDetector(onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Allstatemap(
                          lat: place['lat'],
                          lng: place['lng'],
                          title: place['title'],
                        ),
                      ),
                    );
                  },
                    child: Card(
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
                                        style: TextStyle(fontWeight: FontWeight.bold)
                                     , maxLines: 1
                                      ,overflow: TextOverflow.ellipsis,),

                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
              }),
        ),


      ],),
    );
  }
}
