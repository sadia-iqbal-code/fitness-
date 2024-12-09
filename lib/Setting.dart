
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';
import 'package:untitled1/privacyPolicy.dart';
class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

 class _SettingState extends State<Setting> {


  final InAppReview inAppReview = InAppReview.instance;

  void _requestReview() async {
    final isAvailable = await inAppReview.isAvailable();
    if (isAvailable) {
      inAppReview.requestReview();
    } else {
      // Handle the case where review prompt is not available
      // You might show a message to the user or redirect them to Play Store link
      inAppReview.openStoreListing();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 40,),
          GestureDetector(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyPolicyScreen()));},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(height: 50,
                decoration: BoxDecoration(
              color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),

                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(Icons.privacy_tip_rounded,color: Colors.teal,),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Privacy Policy',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
          GestureDetector(
             onTap: (){showRateUsDialog(context);},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),

                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(Icons.star_rate,color: Colors.teal,),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Rate Us',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: (){

              Share.share(
                'Check out this amazing app! com.Fitness.app',
                subject: 'Amazing App',
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),

                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(Icons.share_outlined,color: Colors.teal,),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Share',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  Future<void> showRateUsDialog(BuildContext context) async {
    double userRating = 0.0;

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Rate Us'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('How was your experience?'),
            SizedBox(height: 16),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                userRating = rating;
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Save the rating or take appropriate action
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Thanks for rating us $userRating stars!')),
              );
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }









 }






