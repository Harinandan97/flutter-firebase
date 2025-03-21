import 'package:flutter/material.dart';

import '../explore click/click.dart';
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
      'location': 'Nilagiri,Tamilnadu,india',
      'About': '  incredible hill views ',

    },
    {
      'image': 'assets/images/chennai.jpg',
      'title': 'Chennai',
      'location': 'chennai,Tmailnadu,india',
      'About': 'rich and diverse culture.',

    },
    {
      'image': 'assets/images/kanniyakumari.jpg',
      'title': 'Kanniyakumari',
      'location': 'Kanniyakumari,Tamilnadu,india',
      'About': 'Vivekananda Rock  ',

    },
    {
      'image': 'assets/images/rameshwaram.jpg',
      'title': 'Rameshwaram',
      'location': 'Ramanathapuram,Tamilnadu,india',
      'About': ' Hindu pilgrimage site'
      ,

    },
    {
      'image': 'assets/images/kodaikanal.jpg',
      'title': 'Kodaikanal',
      'location': 'Dindigul,Tamilnadu,india',
      'About': ' wildlife sanctuaries '
      ,

    },
    {
      'image': 'assets/images/mudumalai.webp',
      'title': 'Mudumalai',
      'location': 'Nilagiri,Tamilnadu,india',
      'About': 'rich biodiversity'
      ,

    },
    {
      'image': 'assets/images/coonor.jpg',
      'title': 'Coornor',
      'location': ' Nilgiris,Tamilnadu,india',
      'About': 'protected diverse forests'
      ,

    },
    {
      'image': 'assets/images/Thanjavur.jpg',
      'title': 'Thanjavur',
      'location': ' Thanjavur,Tamilnadu,india',
      'About': 'rich history '
      ,

    },











  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: GestureDetector(onTap:(){

          } ,
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
              (crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8
            ), itemCount: places.length,
                itemBuilder: (context,index){
                  var place = places[index];

                  return
                    Card(
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
                    );
                }),
          ),
        ),


      ],),
    );
  }
}
