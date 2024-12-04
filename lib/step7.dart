import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/HomePage.dart';
import 'package:untitled1/userProvider.dart';
class step7 extends StatefulWidget {
  const step7({super.key});

  @override
  State<step7> createState() => _step7State();
}

class _step7State extends State<step7> {

  String? selectedWeight;

  final List<String> ageList = List.generate(100, (index) => (index + 1).toString());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(

            children: [
              SizedBox(height: 30,),
              Text('Goal',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(height: 20),
              Text('Step: 7',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.green),),
              SizedBox(height: 20),
              Consumer<UserProvider>(
                builder: (context, userProvider, child) {
                  return Text("${userProvider.username},What is your target weight?",
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),);
                },
              ),
              SizedBox(height: 50,),
              Container(
                decoration: BoxDecoration(

                ),
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "pick your target weight?",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 8,
                                  offset: Offset(2, 4),
                                ),
                              ],
                            ),
                            child: DropdownButtonHideUnderline(

                              child: DropdownButton<String>(
                                // value: ageList.contains(selectedAge) ? selectedAge : null,
                                value: selectedWeight,
                                isExpanded: true,
                                hint: Text("Select your target weight"),
                                style: TextStyle(fontSize: 18, color: Colors.black87),
                                items: ageList.map((age) {
                                  return DropdownMenuItem(
                                    value: age,
                                    child: Text(age),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedWeight = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {
                              if (selectedWeight != null) {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text(
                                      "Target weight Selected",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    content: Text(
                                      "You selected target weight: $selectedWeight",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "OK",
                                          style: TextStyle(color: Colors.purple),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Please select a target weight!"),
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Colors.pinkAccent,
                              elevation: 5,
                            ),
                            child: Text(

                              "Submit weight",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                            ),
                          ),
                          if (selectedWeight != null) ...[
                            SizedBox(height: 40),
                            Text(
                              "Your target weight: $selectedWeight cm",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ]
                    )
                ),
              ),


          SizedBox(height: 80,),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),),



                  onPressed: validateAndProceed,
                  child: Text("Next",style: TextStyle(fontSize: 18),),
                ),
              )




            ],

          ),
        )
    );
  }


  void validateAndProceed() {
    if (selectedWeight == null) {
      // Show a dialog if no option is selected
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Selection Required'),
            content: const Text('Please select an option to proceed.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }

    else {
      // Navigate to the next screen if an option is selected
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }
}