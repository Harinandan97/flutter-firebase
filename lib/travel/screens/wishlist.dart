import 'package:firebasenew/travel/screens/wishd.dart';
import 'package:flutter/material.dart';

class WishlistPage extends StatefulWidget {
  final List<Map<String, dynamic>> wishlist;

  WishlistPage({required this.wishlist});

  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Wishlist")),
      body: widget.wishlist.isEmpty
          ? Center(
        child: Text(
          "Your wishlist is empty!",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )
          : GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemCount: widget.wishlist.length,
        itemBuilder: (context, index) {
          var item = widget.wishlist[index];
          return Stack(
            children: [
              GestureDetector(onTap: (){


              },
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.asset(
                          item['image'],
                          height: 120,
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
                              item['title'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4),
                            Text(item['location'], style: TextStyle(color: Colors.grey[600])),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(item['price'], style: TextStyle(fontWeight: FontWeight.bold)),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.orange, size: 16),
                                    Text(item['rating'].toString()),
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
              ),
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      widget.wishlist.removeAt(index);
                    });
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
