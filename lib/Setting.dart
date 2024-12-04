
import 'package:flutter/material.dart';
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
            onTap: ()=>_requestReview,
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
                'Check out this amazing app! com.Scholarship.app',
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
  void rateUsDialogue(BuildContext context){
    showModalBottomSheet(context: context, builder: (BuildContext context){
      return Container(
        padding: EdgeInsets.all(16.0),
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rate Us',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Text('If you enjoy using our app, please take a moment to rate us. Your feedback is important to us!',style: TextStyle(fontSize: 16),),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text('Rate Now'),),
            TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Cancel')),
          ],
        ),
      );
    });
  }
}






