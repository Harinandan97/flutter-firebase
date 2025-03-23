import 'package:flutter/material.dart';

import '../explore click/click.dart';
import 'allmaps.dart';
void main(){
  runApp(MaterialApp(home: Tamilnaduu(),));
}

class Tamilnaduu extends StatefulWidget {
  const Tamilnaduu({super.key});

  @override
  State<Tamilnaduu> createState() => _Tamilnaduu();
}

class _Tamilnaduu extends State<Tamilnaduu> {
  final List<Map<String,dynamic>> places=[


    {
      'image': 'assets/images/ootya.jpg',
      'title': 'Ooty',
      'location': 'Nilgiri, Tamil Nadu, India',
      'About': 'Incredible hill views',
      'lat': 11.4064,
      'lng': 76.6932,
    },
    {
      'image': 'assets/images/chennai.jpg',
      'title': 'Chennai',
      'location': 'Chennai, Tamil Nadu, India',
      'About': 'Rich and diverse culture',
      'lat': 13.0827,
      'lng': 80.2707,
    },
    {
      'image': 'assets/images/kanniyakumari.jpg',
      'title': 'Kanniyakumari',
      'location': 'Kanniyakumari, Tamil Nadu, India',
      'About': 'Vivekananda Rock',
      'lat': 8.0883,
      'lng': 77.5385,
    },
    {
      'image': 'assets/images/rameshwaram.jpg',
      'title': 'Rameshwaram',
      'location': 'Ramanathapuram, Tamil Nadu, India',
      'About': 'Hindu pilgrimage site',
      'lat': 9.2889,
      'lng': 79.3129,
    },
    {
      'image': 'assets/images/kodaikanal.jpg',
      'title': 'Kodaikanal',
      'location': 'Dindigul, Tamil Nadu, India',
      'About': 'Scenic hill station',
      'lat': 10.2381,
      'lng': 77.4892,
    },
    {
      'image': 'assets/images/mudumalai.webp',
      'title': 'Mudumalai',
      'location': 'Nilgiri, Tamil Nadu, India',
      'About': 'Rich biodiversity',
      'lat': 11.5996,
      'lng': 76.6360,
    },
    {
      'image': 'assets/images/coonor.jpg',
      'title': 'Coonoor',
      'location': 'Nilgiris, Tamil Nadu, India',
      'About': 'Tea gardens and hills',
      'lat': 11.3535,
      'lng': 76.7946,
    },
    {
      'image': 'assets/images/Thanjavur.jpg',
      'title': 'Thanjavur',
      'location': 'Thanjavur, Tamil Nadu, India',
      'About': 'Rich history',
      'lat': 10.7867,
      'lng': 79.1378,
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
