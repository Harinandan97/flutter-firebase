import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class BookingHistory extends StatefulWidget {
  @override
  _BookingHistoryState createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  late Razorpay _razorpay;
  void _handlepaymentsuccess(PaymentSuccessResponse response){
    print("sucess paymeny :$response");

  }
  void _handlepaymenyerror(PaymentFailureResponse response){
    print("error response: $response");
  }
  void _handleExternalvallet(ExternalWalletResponse response){
    print("external sdk Response: $response");
  }
  @override
  void initState(){
    super.initState();
    _razorpay =Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlepaymentsuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,_handlepaymenyerror );
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,  _handleExternalvallet);


  }

  Future<void> deleteBooking(String docId) async {
    try {
      await firestore.collection('book').doc(docId).delete();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Booking Cancelled successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error Cancelling booking: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final User? user = auth.currentUser;
    final String? uid = user?.uid;

    if (uid == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Booking History')),
        body: Center(child: Text('You must be logged in to view booking history.')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Booking History'),
        backgroundColor: Colors.red,actions: [IconButton(onPressed: (){

      }, icon: Column(
        children: [
          Expanded(child: Icon(Icons.question_mark)),Text("Help")
        ],
      ))],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore
            .collection('book')
            .where('uid', isEqualTo: uid)
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No Bookings Found.'));
          }

          var bookings = snapshot.data!.docs;

          return ListView.builder(
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              var booking = bookings[index].data() as Map<String, dynamic>;
              var docId = bookings[index].id;

              return Card(
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(

                  title: Text(booking['hotel name'] ?? 'No Hotel Name'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Location: ${booking['location'] ?? 'Unknown Location'}"),
                      Text("Name: ${booking['name'] ?? 'No Name'}"),
                      Text("Phone: ${booking['phone'] ?? 'No Phone'}"),
                      Text("Email: ${booking['email'] ?? 'No Email'}"),
                      Text("Check-in: ${booking['in'] ?? 'N/A'}"),
                      Text("Check-out: ${booking['out'] ?? 'N/A'}"),
                    ],
                  ),
                  trailing: Wrap(
                      direction: Axis.vertical,
                      spacing: 4,
                    children: [Column(
                      children: [
                        TextButton(onPressed: (){
                          openCheckout(1,"Zoople","Course fee");
                        }, child: Wrap(children: [Text('payment'),Icon(Icons.payment)])),
                      ],
                    ),
                      TextButton(child: Text("Cancel"),

                        onPressed: () async {
                          bool? confirmDelete = await showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('cancel Booking'),
                              content: Text('Are you sure you want to cancel this booking?'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(false),
                                  child: Text('No',style: TextStyle(color: Colors.red)),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(true),
                                  child: Text('Yes', ),
                                ),
                              ],
                            ),
                          );

                          if (confirmDelete == true) {
                            deleteBooking(docId);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );// 'rzp_live_ILgsfZCZoFIKMb
  }

  void openCheckout(int amt, String shopename, String discription) async{
    var options = {
      'key': 'rzp_live_ILgsfZCZoFIKMb', // Use your Razorpay test key
      'amount': amt * 1000, // in paise
      'name': shopename,
      'description': discription,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {
        'contact': '9074858214',
        'email': 'zoople@gmail.com'
      },
      'external': {
        'wallets': ['paytm'] // use supported wallets only
      }
    };

    try{
      _razorpay.open(options);
    }catch(e){
      debugPrint('error:e');
    }
  }
}
