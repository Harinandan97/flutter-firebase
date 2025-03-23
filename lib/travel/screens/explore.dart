import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebasenew/travel/screens/wishd.dart';
import 'package:firebasenew/travel/screens/wishlist.dart';
import 'package:firebasenew/travel/states/karnataka.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../explore click/click.dart';
import '../states/goa.dart';
import '../states/kerala.dart';
import '../states/tamilnadu.dart';
import '../states/telangana.dart';

void main() {
  runApp(MaterialApp(home: Explore()));
}

class Explore extends StatefulWidget {
  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> filteredListings = []; // Filtered list
  final List<Map<String, dynamic>> listings = [
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
    {
      'image': 'assets/images/River Side Resort.jpeg',
      'title': 'River Side Resort',
      'location': 'Kerala, India',
      'price': '₹1500/night',
      'rating': 4.5
    },
    {
      'image': 'assets/images/Hill View Resort.jpeg',
      'title': 'Hill View Resort',
      'location': 'Munnar, India',
      'price': '₹1500/night',
      'rating': 4.8
    },
    {
      'image': 'assets/images/Beach Resort.jpeg',
      'title': 'Beach Resort',
      'location': 'Goa, India',
      'price': '₹1500/night',
      'rating': 4.6
    },
    {
      'image': 'assets/images/Hill Station Resort.jpeg',
      'title': 'Hill Station Resort',
      'location': 'Bangalore, India',
      'price': '₹1500/night',
      'rating': 4.9
    },
    {
      'image': 'assets/images/Lake Side Resort.jpeg',
      'title': 'Lake Size Resort',
      'location': 'Himachal Pradesh, India',
      'price': '₹1500/night',
      'rating': 4.7
    },
  ];
  @override
  void initState() {
    super.initState();
    filteredListings = listings; // Initially show all items
  }
  void filterSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredListings = listings;
      } else {
        filteredListings = listings
            .where((listing) => listing['title'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }


  List<Map<String, dynamic>> wishlist = [];
  void toggleWishlist(Map<String, dynamic> listing) {
    setState(() {
      if (wishlist.contains(listing)) {
        wishlist.remove(listing);
      } else {
        wishlist.add(listing);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            children: [
              TextField(
                controller: searchController,
                onChanged: filterSearch, // Call function when user types
                decoration: InputDecoration(
                  hintText: "Start your Search",

                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),

            ],
          ),
        ), actions: [
        IconButton(
          icon: Icon(Icons.favorite, color: Colors.red),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WishlistPage(wishlist: wishlist)),
            );
          },
        ),
      ],
      
      ),
      body: Column(
        children: [
          CarouselSlider(
            items: [
              TextButton(
                onPressed: () {
                  Navigator.push((context), MaterialPageRoute(builder: (context)=>kerala()));
                },
                child: Column(
                  children: [CircleAvatar(backgroundImage: AssetImage("assets/images/kerala.jpeg"),), Text('Kerala')],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push((context), MaterialPageRoute(builder: (context)=> Tamilnaduu()));
                },
                child: Column(
                  children: [CircleAvatar(backgroundImage: AssetImage("assets/images/tamilnadu.jpeg"),), Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('Tamil  Nadu'),
                  )],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push((context), MaterialPageRoute(builder: (context)=> Karnatakaa()));
                },
                child: Column(
                  children: [CircleAvatar(backgroundImage: AssetImage('assets/images/Karnataka.jpeg'),), Text('Karntaka')],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push((context), MaterialPageRoute(builder: (context)=> Goaa()));
                },
                child: Column(
                  children: [CircleAvatar(backgroundImage: AssetImage('assets/images/Goa.jpeg'),), Text('Goa')],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push((context), MaterialPageRoute(builder: (context)=> Telanganaa()));
                },
                child: Column(
                  children: [CircleAvatar(backgroundImage: AssetImage('assets/images/telangana.jpeg'),), Text('telangna')],
                ),
              ),
            ],
            options: CarouselOptions(
              height: 100,
              aspectRatio: 16 / 9,
              viewportFraction: 0.2,
              initialPage: 2,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemCount: filteredListings.length,

              itemBuilder: (context, index) {
                var listing = filteredListings[index];
                return GestureDetector(onTap: (){
                  toggleWishlist(listing);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                    content: Text("added to wishlist"),
                    ),
                  );
                },

                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                          child: Image.asset(
                            listing['image'],
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
                                listing['title'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4),
                              Text(listing['location'],
                                  style: TextStyle(color: Colors.grey[600])),
                              SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(listing['price'],
                                      style: TextStyle(fontWeight: FontWeight.bold)),
                                  Row( mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.star, color: Colors.orange, size: 16),
                                      Text(listing['rating'].toString()),
                                      IconButton(onPressed: (){

                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("booking added")));
                                      }, icon: Icon(Icons.add,))
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },

            ),


          ),

        ],
      ),
    );
  }
}
