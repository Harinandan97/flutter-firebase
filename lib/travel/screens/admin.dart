import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: AdminPage(),));
}
class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  List<Map<String, dynamic>> listings = [
    {
      'image': 'assets/images/Cozy Apartment in City Center.jpg',
      'title': 'Cozy Apartment in City Center',
      'location': 'Bangalore, India',
      'price': '₹1500/night',
      'rating': 4.8
    },
  ];

  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController ratingController = TextEditingController();

  void addListing() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        listings.add({
          'image': 'assets/images/default.jpg',
          'title': titleController.text,
          'location': locationController.text,
          'price': priceController.text,
          'rating': double.parse(ratingController.text),
        });
      });
      Navigator.pop(context);
    }
  }

  void deleteListing(int index) {
    setState(() {
      listings.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Panel")),
      body: ListView.builder(
        itemCount: listings.length,
        itemBuilder: (context, index) {
          var listing = listings[index];
          return Card(
            child: ListTile(
              leading: Image.asset(listing['image'], width: 50, height: 50, fit: BoxFit.cover),
              title: Text(listing['title']),
              subtitle: Text("${listing['location']} - ${listing['price']}"),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => deleteListing(index),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Add Listing"),
              content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(labelText: "Title"),
                      validator: (value) => value!.isEmpty ? "Enter title" : null,
                    ),
                    TextFormField(
                      controller: locationController,
                      decoration: InputDecoration(labelText: "Location"),
                      validator: (value) => value!.isEmpty ? "Enter location" : null,
                    ),
                    TextFormField(
                      controller: priceController,
                      decoration: InputDecoration(labelText: "Price"),
                      validator: (value) => value!.isEmpty ? "Enter price" : null,
                    ),
                    TextFormField(
                      controller: ratingController,
                      decoration: InputDecoration(labelText: "Rating"),
                      keyboardType: TextInputType.number,
                      validator: (value) => value!.isEmpty ? "Enter rating" : null,
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
                TextButton(onPressed: addListing, child: Text("Add")),
              ],
            ),
          );
        },
      ),
    );
  }
}
