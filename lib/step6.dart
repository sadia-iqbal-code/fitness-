
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/step7.dart';
import 'package:untitled1/userProvider.dart';


class step6 extends StatefulWidget {
  @override
  _step6State createState() => _step6State();
}

class _step6State extends State<step6> {
  int selectedAge = 18; // Default age

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // appBar: AppBar(
      //   title: Text(
      //     'Select Your Age',
      //     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      //   ),
      //   centerTitle: true,
      // ),

      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
SizedBox(height: 30,),

                Text(
                  'Goal',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 20,),
                Text(
                  'Step : 6',
                  style: TextStyle(fontSize: 18, color: Colors.green,fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Consumer<UserProvider>(
                    builder: (context, userProvider, child) {
                      return Text("${userProvider.username},Choose your Age please",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),);
                    } ),

            SizedBox(height: 80,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'How old are you?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Number Picker Widget
                NumberPicker(
                  minValue: 10,
                  maxValue: 100,
                  value: selectedAge,
                  step: 1,
                  itemHeight: 50,
                  textStyle: TextStyle(fontSize: 18, color: Colors.grey[600]),
                  selectedTextStyle:
                  TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  onChanged: (value) {
                    setState(() {
                      selectedAge = value;
                    });
                  },
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 150),
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('You selected age: $selectedAge'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>step7()));
                      // Navigate to the next screen or process the age
                      // Example: Navigator.pushNamed(context, '/nextScreen');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
