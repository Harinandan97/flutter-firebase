import 'package:flutter/material.dart';
import 'all.dart';

class trips extends StatefulWidget {
  const trips({super.key});

  @override
  State<trips> createState() => _tripsState();
}

class _tripsState extends State<trips> {
  List<Map<String, dynamic>> selectedTrips = [];

  void addTrip(Map<String, dynamic> place) {
    if (!selectedTrips.any((trip) => trip['title'] == place['title'])) {
      setState(() {
        selectedTrips.add(place);
      });
    }
  }

  void removeTrip(int index) {
    setState(() {
      selectedTrips.removeAt(index);
    });
  }

  Future<void> openLocationsPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Alllocations(
          onTripSelected: addTrip,
        ),
      ),
    );

    // Optional: show a message
    if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("${result['title']} added to trips")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Trips", style: TextStyle(fontWeight: FontWeight.bold))),
      ),
      body: selectedTrips.isEmpty
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("No trips booked...yet!", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: openLocationsPage,
            icon: Icon(Icons.search),
            label: Text("Start Searching"),
          ),
        ],
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: selectedTrips.length,
              itemBuilder: (context, index) {
                final trip = selectedTrips[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: Image.asset(
                      trip['image'],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(trip['title']),
                    subtitle: Text(trip['location']),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => removeTrip(index),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton.icon(
              onPressed: openLocationsPage,
              icon: Icon(Icons.add),
              label: Text("Add More"),
            ),
          ),
        ],
      ),
    );
  }
}
