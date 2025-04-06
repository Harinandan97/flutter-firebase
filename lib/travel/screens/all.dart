import 'package:flutter/material.dart';

class Alllocations extends StatefulWidget {
  final Function(Map<String, dynamic>) onTripSelected;
  const Alllocations({super.key, required this.onTripSelected});

  @override
  State<Alllocations> createState() => _AlllocationsState();
}

class _AlllocationsState extends State<Alllocations> {
  final List<Map<String,dynamic>> places=[

    {
      'image': 'assets/images/kozikodu beach.jpg',
      'title': 'Kozhikode Beach',
      'location': 'Kozhikode,Kerala,india',
      'About': '  coastal destination ',

    },
    {
      'image': 'assets/images/kochi.jpeg',
      'title': 'Kochi',
      'location': 'Eranakulam,Kerala,india',
      'About': 'Queen of the Arabian Sea',

    },
    {
      'image': 'assets/images/Thiruvananthapuram.jpeg',
      'title': 'Thiruvananthapuram',
      'location': 'Thiruvananthapuram,Kerala,india',
      'About': ' rich cultural heritage',

    },
    {
      'image': 'assets/images/Munnar.jpeg',
      'title': 'Munnar',
      'location': 'Idukki,Kerala,india',
      'About': 'Virgin forests,rolling hills'
      ,

    },
    {
      'image': 'assets/images/wynad.jpg',
      'title': 'Wayanad',
      'location': 'Wayanad,Kerala,india',
      'About': ' wildlife sanctuaries '
      ,

    },
    {
      'image': 'assets/images/alappuzha.jpeg',
      'title': 'Kuttanadu',
      'location': 'Alappuzha,Kerala,india',
      'About': 'coir industry'
      ,

    },
    {
      'image': 'assets/images/periyar.jpg',
      'title': 'Periyar National Park',
      'location': 'Idukki,Kerala,india',
      'About': 'protected diverse forests'
      ,

    },
    {
      'image': 'assets/images/bekal.jpg',
      'title': 'Bekal',
      'location': 'Kasarkodu,Kerala,india',
      'About': ' a coastal town  '
      ,

    },

    {
      'image': 'assets/images/Dudhsagar Falls.webp',
      'title': 'Dudhsagar Falls',
      'location': 'Sonauli,Goa,india',
      'About': '3-streamed waterfal ',

    },
    {
      'image': 'assets/images/Aguada Fort.jpg',
      'title': 'Aguada Fort',
      'location': ' North Goa ,Goa,india',
      'About':'grand architecture',

    },
    {
      'image': 'assets/images/Baga Beach.jpg',
      'title': 'Baga Beach',
      'location': 'Bardez,Goa,india',
      'About': ' vibrant nightlife',

    },
    {
      'image': 'assets/images/Harvalem Waterfalls.jpg',
      'title': 'Harvalem Waterfalls',
      'location': 'Kudne,Goa,india',
      'About': 'Natural beauty'
      ,

    },
    {
      'image': 'assets/images/Reis Magos Fort.webp',
      'title': 'Reis Magos Fort',
      'location': 'Goa,india',
      'About': 'bastions of Portuguese'
      ,

    },
    {
      'image': 'assets/images/Basilica of Bom Jesus.jpg',
      'title': 'Basilica of Bom Jesus',
      'location': 'Goa,india',
      'About': ' baroque architecture'
      ,

    },
    {
      'image': 'assets/images/Arambol Beach.jpg',
      'title': 'Arambol Beach',
      'location': 'Goa,india',
      'About': 'crystalclear waters'
      ,

    },
    {
      'image': 'assets/images/Chapora Fort.jpg',
      'title': 'Chapora Fort',
      'location': 'Goa,india',
      'About': 'spectacular views '
      ,

    },
    {
      'image': 'assets/images/mysoorpalace.jpg',
      'title': 'Mysurupalace',
      'location': 'Mysoor,Karnataka,india',
      'About': 'the skyline of Mysuru ',

    },
    {
      'image': 'assets/images/Bengaluru.jpg',
      'title': 'Bengaluru',
      'location': 'Bengaluru,Karnataka,india',
      'About': 'historical sites and IT',

    },
    {
      'image': 'assets/images/Nagarahole Tiger Reserve.jpg',
      'title': 'Nagarahole Tiger Reserve',
      'location': 'Mysore&Kodagu,Karnataka,india',
      'About': 'wildlife',

    },
    {
      'image': 'assets/images/chickmagloor.jpg',
      'title': 'Chikkamagaluru',
      'location': 'Chikkamagaluru,Karnataka,india',
      'About': ' natural beauty & trekking'
      ,

    },
    {
      'image': 'assets/images/Hampi.jpg',
      'title': 'Hampi',
      'location': 'Vijayanagara,Karnataka,india',
      'About': 'UNESCO World Heritages '
      ,

    },
    {
      'image': 'assets/images/Nandi Hills.jpg',
      'title': 'Nandi Hills',
      'location': 'Chikkaballapur ,Karnataka,india',
      'About': 'stunning natural beauty'
      ,

    },
    {
      'image': 'assets/images/Murdeshwar.jpeg',
      'title': 'Murdeshwar National Park',
      'location': 'Uttara Kannada,Karnataka,india',
      'About': '2ndlargest Shivastatue'
      ,

    },
    {
      'image': 'assets/images/ISKCON Temple.jpg',
      'title': 'ISKCON Temple',
      'location': 'Bengaluru,Karnataka,india',
      'About': 'spiritual ambiance'
      ,

    },


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


    {
      'image': 'assets/images/Charminar.webp',
      'title': 'Charminar',
      'location': 'Telangana,india',
      'About': ' Indo-Islamic architecture ',

    },
    {
      'image': 'assets/images/Golconda Fort.jpg',
      'title': 'Golconda Fort',
      'location': 'Telangana,india',
      'About': 'impressive architecture',

    },
    {
      'image': 'assets/images/Ramoji Film City.jpg',
      'title': 'Ramoji Film City',
      'location': 'Telangana,india',
      'About': 'worlds largest film studio',

    },
    {
      'image': 'assets/images/Hyderabad.jpg',
      'title': 'Hyderabad',
      'location': 'Telangana,india',
      'About': 'rich history'
      ,

    },
    {
      'image': 'assets/images/Mallela Thirtham Waterfall.jpg',
      'title': 'Mallela Thirtham Waterfall',
      'location': 'Telangana,india',
      'About': '  exquisite place '
      ,

    },
    {
      'image': 'assets/images/Nehru Zoological Park.jpg',
      'title': 'Nehru Zoological Park',
      'location': 'Telangana,india',
      'About': 'park'
      ,

    },
    {
      'image': 'assets/images/Kuntala Water Falls.jpg',
      'title': 'Kuntala Water Falls',
      'location': 'Telangana,india',
      'About': 'Natural beauty'
      ,

    },
    {
      'image': 'assets/images/Birla Mandir.jpg',
      'title': 'Birla Mandir',
      'location': 'Telangana,india',
      'About': 'white marble architecture '
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
                    GestureDetector( onTap: () {
                      widget.onTripSelected(place); // Add the trip
                      Navigator.pop(context, place); // Return to previous page with data
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
        ),


      ],),
    );
  }
}
