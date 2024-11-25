import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/step3.dart';
import 'package:untitled1/userProvider.dart';

class step2 extends StatefulWidget {
  @override
  _step2State createState() => _step2State();
}

class _step2State extends State<step2> {
  bool fullBody = false;
  bool arms = false;
  bool legs = false;
  bool butt = false;

  void toggleFullBody(bool value) {
    setState(() {
      fullBody = value;
      if (value) {
        arms = true;
        legs = true;
        butt = true;
      }
    });
  }

  void toggleSpecificOption(String option, bool value) {
    setState(() {
      if (option == 'arms') arms = value;
      if (option == 'legs') legs = value;
      if (option == 'butt') butt = value;

      // Uncheck full body if a specific option is toggled
      if (!value || (arms && legs && butt)) {
        fullBody = arms && legs && butt;
      }
    });
  }

  bool get canNavigate => fullBody || arms || legs || butt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Text('Goal',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(height: 16,),
              Text('Step: 2',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.green ),),
              SizedBox(height: 16,),




               Consumer<UserProvider>(
                builder: (context, userProvider, child) {
                  return Text("${userProvider.username},Choose your target zones",
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),);
                },
              ),


              SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CheckboxListTile(
                title: Text('Full Body',style: TextStyle(fontSize: 24,),),
                value: fullBody,
                onChanged: (value) => toggleFullBody,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CheckboxListTile(
                title: Text('Arms',style: TextStyle(fontSize: 24),),
                value: arms,
                onChanged: (value) => toggleSpecificOption('arms', value!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CheckboxListTile(
                title: Text('Legs',style: TextStyle(fontSize: 24),),
                value: legs,
                onChanged: (value) => toggleSpecificOption('legs', value!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CheckboxListTile(
                title: Text('Butt',style: TextStyle(fontSize: 24),),
                value: butt,
                onChanged: (value) => toggleSpecificOption('butt', value!),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(style:  ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),),
              onPressed: canNavigate
                  ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => step3() ,
                  ),
                );
              }
                  : null,
              child: Text('Next',style: TextStyle(fontSize: 18),),
            ),
          ],
        ),
      ),
    );
  }
}


