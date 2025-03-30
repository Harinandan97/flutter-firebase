import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebasenew/travel/screens/wishd.dart';
import 'package:firebasenew/travel/screens/wishlist.dart';
import 'package:firebasenew/travel/states/karnataka.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../firebase_options.dart';
import '../explore click/click.dart';
import '../states/goa.dart';
import '../states/kerala.dart';
import '../states/tamilnadu.dart';
import '../states/telangana.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MaterialApp(home: Explore()));
// }

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
      'rating': 4.8,

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
                                        show(context, listing['image'], listing['title'],listing['location'],listing['price']);

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
GlobalKey<FormState>form=GlobalKey();
bool isAgreed = false;
void show(BuildContext context, String imagePath, String hotelName,String locc,String pr)
{
  TextEditingController hotelNameController = TextEditingController(text: hotelName);
  TextEditingController locationcontroller =TextEditingController(text: locc);
  TextEditingController namee=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController email=TextEditingController();

  TextEditingController gust=TextEditingController();
  TextEditingController room=TextEditingController();
  TextEditingController cin=TextEditingController();
  TextEditingController cout=TextEditingController();

  showModalBottomSheet(context: context,
      isScrollControlled: true,
      builder: (context){

        return Form(key: form,
          child: ListView(

            children: [
              Image.asset(imagePath, height: 200, fit: BoxFit.cover),
              Text(hotelName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
textAlign: TextAlign.center,
              ),
              Text(locc
              ,style: TextStyle(fontSize: 18),textAlign: TextAlign.center,
              ),
              Text(pr,
              style: TextStyle(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,),



              ListTile(
                leading: Icon(Icons.hotel),
                title: TextFormField(controller: hotelNameController,
                decoration: InputDecoration(
                  labelText: 'Hotel name',
                  hintText: "Hotel name",border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                ),readOnly: true,),
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: TextFormField(controller: locationcontroller,
                  decoration: InputDecoration(
                      labelText: 'Location',
                      hintText: "Location",border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                  ),readOnly: true,),
              ),


              ListTile(
                leading: Icon(Icons.person),
                title: TextFormField(
                  controller: namee,
                  decoration: InputDecoration(hintText: "Name",labelText: "name",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                validator: (name){
                  if(name!.isEmpty){
                    return "please enter the name";
                  }
                },
                ),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: TextFormField(
                  controller: phone,
                  decoration: InputDecoration(hintText: "phone",labelText: "phone",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                ),
                validator: (phone){
                  if(phone!.isEmpty){
                    return "Pleas enter the number";

                  }else{
                    return null;
                  }

                },
                ),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: TextFormField(
                  controller: email,
                  decoration: InputDecoration(hintText: " Email",labelText: "Email",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)
                )
                )

                  ,
                validator: (email){
                  if(email!.isEmpty){
                    return "Please enter a valid Email";
                  }
                  else{
                    return null;
                  }
                },),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.group),
                title: DropdownButtonFormField<String>(

                    decoration: InputDecoration(
                        labelText: "Gusts",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                    items: ['1','2','3','4','5','6','7','8','9','10'].map((String gusttype){
                      return DropdownMenuItem<String>(
                        value: gusttype,
                          child: Text(gusttype)
                      );
                    }).toList(),

                    onChanged: (value){},


                validator: (gsutno)=> gsutno ==null?"please select no of gusts" :null,
                ),
              ),
              ListTile(
                leading: Icon(Icons.king_bed),
                title: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Room Type",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  items: ["Single", "Double", "Suite", "Deluxe"].map((String roomType) {
                    return DropdownMenuItem<String>(
                      value: roomType,
                      child: Text(roomType),
                    );
                  }).toList(),
                  onChanged: (value) {},
                  validator: (value) => value == null ? "Please select a room type" : null,
                ),
              ),
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: TextFormField(
                  controller: cin,
                  decoration: InputDecoration(
                    hintText: "Check-in Date",
                    labelText: "Check-in Date",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter the check-in date";
                    }
                    return null;
                  },
                ),
              ),
          ListTile(
            leading: Icon(Icons.calendar_today_outlined),
            title: TextFormField(
              controller: cout,
              decoration: InputDecoration(
                hintText: "Check-out Date",
                labelText: "Check-out Date",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter the check-out date";
                }
                return null;
              },
            ),),
              // CheckboxListTile(
              //   title: Text('I agree to the Terms & Conditions'),
              //     value: isAgreed,
              //     onChanged: (value){
              //     isAgreed==true;
              //
              //
              //     },
              //   controlAffinity: ListTileControlAffinity.leading,),
              SizedBox(height: 16,),
              ElevatedButton(onPressed: ()async{
                var valid=form.currentState!.validate();
                if(valid){
                  Navigator.pop(context);

                // await hoteregister();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("booking added")));
                }

              },
                   style: ElevatedButton.styleFrom(backgroundColor: Colors.red,),
                  child: Text("Book now"))
            ],
          ),
        );

      });

  //
  // Future<void> hoteregister() async {
  //   try {
  //     FirebaseFirestore firestore = FirebaseFirestore.instance;
  //
  //     // Creating a document in 'bookings' collection
  //     await firestore.collection('book').add({
  //       'name': namee.text.trim(),
  //       'phone': phone.text.trim(),
  //       'email': email.text.trim(),
  //       'in': cin.text.trim(),
  //       'out': cout.text.trim(),
  //       'hotel name': hotelNameController.text.trim(),
  //       'location': locationcontroller.text.trim(),
  //       'timestamp': FieldValue.serverTimestamp(),
  //     });
  //
  //     print("Booking added successfully!");
  //   } catch (e) {
  //     print("Failed to add booking: $e");
  //   }
  // }

}

