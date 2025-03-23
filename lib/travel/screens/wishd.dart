import 'package:flutter/material.dart';

class wish extends StatefulWidget {
  const wish({super.key});

  @override
  State<wish> createState() => _wishState();
}

class _wishState extends State<wish> {
  final List<Map<String, dynamic>> listing = [
  {
  'image': 'assets/images/Cozy Apartment in City Center.jpg',
  'title': 'Cozy Apartment in City Center',
  'location': 'Bangalore, India',
  'price': '₹1500/night',
  'rating': 4.8
},
{
'image': 'assets/images/Luxury Villa with Pool.jpeg',
'title': 'Luxury Villa with Pool',
'location': 'Goa, India',
'price': '₹2000/night',
'rating': 4.7
},
{
'image': 'assets/images/Beachside Resort.jpeg',
'title': 'Beachside Resort',
'location': 'Kerala, India',
'price': '₹1800/night',
'rating': 4.9
},
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" Booked Hotels",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
      ),
      body:  Expanded(
        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
          (crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8
        ), itemCount: listing.length,
            itemBuilder: (context,index){
              var listings = listing[index];

              return
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.asset(
                          listings['image'],
                          height: 100,
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
                              listings['title'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4),
                            Text(listings['location'],
                                style: TextStyle(color: Colors.grey[600])),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(listings['price'],
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                Row( mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.star, color: Colors.orange, size: 16),
                                    Text(listings['rating'].toString()),

                                  ],
                                ),
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
    );
  }
}
