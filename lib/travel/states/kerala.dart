import 'package:flutter/material.dart';

import '../explore click/click.dart';
import 'allmaps.dart';
void main(){
  runApp(MaterialApp(home: kerala(),));
}

class kerala extends StatefulWidget {
  const kerala({super.key});

  @override
  State<kerala> createState() => _keralaState();
}

class _keralaState extends State<kerala> {
  final List<Map<String, dynamic>> places = [
    {
      'image': 'assets/images/kozikodu beach.jpg',
      'title': 'Kozhikode Beach',
      'location': 'Kozhikode, Kerala, India',
      'About': 'Coastal destination',
      'lat': 11.2588,
      'lng': 75.7804
    },
    {
      'image': 'assets/images/kochi.jpeg',
      'title': 'Kochi',
      'location': 'Eranakulam, Kerala, India',
      'About': 'Queen of the Arabian Sea',
      'lat': 9.9312,
      'lng': 76.2673
    },
    {
      'image': 'assets/images/Thiruvananthapuram.jpeg',
      'title': 'Thiruvananthapuram',
      'location': 'Thiruvananthapuram, Kerala, India',
      'About': 'Rich cultural heritage',
      'lat': 8.5241,
      'lng': 76.9366
    },
    {
      'image': 'assets/images/Munnar.jpeg',
      'title': 'Munnar',
      'location': 'Idukki, Kerala, India',
      'About': 'Virgin forests, rolling hills',
      'lat': 10.0889,
      'lng': 77.0595
    },
    {
      'image': 'assets/images/wynad.jpg',
      'title': 'Wayanad',
      'location': 'Wayanad, Kerala, India',
      'About': 'Wildlife sanctuaries',
      'lat': 11.6854,
      'lng': 76.1320
    },
    {
      'image': 'assets/images/alappuzha.jpeg',
      'title': 'Kuttanadu',
      'location': 'Alappuzha, Kerala, India',
      'About': 'Coir industry',
      'lat': 9.3564,
      'lng': 76.4394
    },
    {
      'image': 'assets/images/periyar.jpg',
      'title': 'Periyar National Park',
      'location': 'Idukki, Kerala, India',
      'About': 'Protected diverse forests',
      'lat': 9.4620,
      'lng': 77.2368
    },
    {
      'image': 'assets/images/bekal.jpg',
      'title': 'Bekal',
      'location': 'Kasargod, Kerala, India',
      'About': 'A coastal town',
      'lat': 12.4010,
      'lng': 75.0483
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
            GestureDetector(
                onTap: () {
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
                                  style: TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis,)),

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
