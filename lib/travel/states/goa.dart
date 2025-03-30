import 'package:flutter/material.dart';

import '../explore click/click.dart';
import 'allmaps.dart';
void main(){
  runApp(MaterialApp(home: Goaa(),));
}

class Goaa extends StatefulWidget {
  const Goaa({super.key});

  @override
  State<Goaa> createState() => _Goaa();
}

class _Goaa extends State<Goaa> {


  final List<Map<String, dynamic>> places = [
    {
      'image': 'assets/images/Dudhsagar Falls.webp',
      'title': 'Dudhsagar Falls',
      'location': 'Sonauli, Goa, India',
      'About': '3-streamed waterfall',
      'lat': 15.3140,
      'lng': 74.3142,
    },
    {
      'image': 'assets/images/Aguada Fort.jpg',
      'title': 'Aguada Fort',
      'location': 'North Goa, Goa, India',
      'About': 'Grand architecture',
      'lat': 15.4920,
      'lng': 73.7733,
    },
    {
      'image': 'assets/images/Baga Beach.jpg',
      'title': 'Baga Beach',
      'location': 'Bardez, Goa, India',
      'About': 'Vibrant nightlife',
      'lat': 15.5524,
      'lng': 73.7517,
    },
    {
      'image': 'assets/images/Harvalem Waterfalls.jpg',
      'title': 'Harvalem Waterfalls',
      'location': 'Kudne, Goa, India',
      'About': 'Natural beauty',
      'lat': 15.5551,
      'lng': 74.0136,
    },
    {
      'image': 'assets/images/Reis Magos Fort.webp',
      'title': 'Reis Magos Fort',
      'location': 'Goa, India',
      'About': 'Bastions of Portuguese',
      'lat': 15.5003,
      'lng': 73.8076,
    },
    {
      'image': 'assets/images/Basilica of Bom Jesus.jpg',
      'title': 'Basilica of Bom Jesus',
      'location': 'Goa, India',
      'About': 'Baroque architecture',
      'lat': 15.5009,
      'lng': 73.9082,

    },
    {
      'image': 'assets/images/Arambol Beach.jpg',
      'title': 'Arambol Beach',
      'location': 'Goa, India',
      'About': 'Crystal clear waters',
      'lat': 15.6868,
      'lng': 73.7046,
    },
    {
      'image': 'assets/images/Chapora Fort.jpg',
      'title': 'Chapora Fort',
      'location': 'Goa, India',
      'About': 'Spectacular views',
      'lat': 15.6069,
      'lng': 73.7448,
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
