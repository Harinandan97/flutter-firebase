import 'package:flutter/material.dart';

import '../explore click/click.dart';
import 'allmaps.dart';
void main(){
  runApp(MaterialApp(home: Telanganaa(),));
}

class Telanganaa extends StatefulWidget {
  const Telanganaa({super.key});

  @override
  State<Telanganaa> createState() => _Telanganaa();
}

class _Telanganaa extends State<Telanganaa> {
  final List<Map<String, dynamic>> places = [
    {
      'image': 'assets/images/Charminar.webp',
      'title': 'Charminar',
      'location': 'Telangana, India',
      'About': 'Indo-Islamic architecture',
      'lat': 17.3616,
      'lng': 78.4747,
    },
    {
      'image': 'assets/images/Golconda Fort.jpg',
      'title': 'Golconda Fort',
      'location': 'Telangana, India',
      'About': 'Impressive architecture',
      'lat': 17.3833,
      'lng': 78.4011,
    },
    {
      'image': 'assets/images/Ramoji Film City.jpg',
      'title': 'Ramoji Film City',
      'location': 'Telangana, India',
      'About': 'Worlds largest film studio',
      'lat': 17.2557,
      'lng': 78.6827,
    },
    {
      'image': 'assets/images/Hyderabad.jpg',
      'title': 'Hyderabad',
      'location': 'Telangana, India',
      'About': 'Rich history',
      'lat': 17.3850,
      'lng': 78.4867,
    },
    {
      'image': 'assets/images/Mallela Thirtham Waterfall.jpg',
      'title': 'Mallela Thirtham Waterfall',
      'location': 'Telangana, India',
      'About': 'Exquisite place',
      'lat': 16.2743,
      'lng': 78.5937,
    },
    {
      'image': 'assets/images/Nehru Zoological Park.jpg',
      'title': 'Nehru Zoological Park',
      'location': 'Telangana, India',
      'About': 'Popular zoo and park',
      'lat': 17.3501,
      'lng': 78.4512,
    },
    {
      'image': 'assets/images/Kuntala Water Falls.jpg',
      'title': 'Kuntala Water Falls',
      'location': 'Telangana, India',
      'About': 'Natural beauty',
      'lat': 19.2030,
      'lng': 78.5293,
    },
    {
      'image': 'assets/images/Birla Mandir.jpg',
      'title': 'Birla Mandir',
      'location': 'Telangana, India',
      'About': 'White marble architecture',
      'lat': 17.4062,
      'lng': 78.4691,
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
                                        style: TextStyle(fontWeight: FontWeight.bold)),

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
