
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/step4.dart';
import 'package:untitled1/userProvider.dart';

class step3 extends StatefulWidget {
  const step3({Key? key}) : super(key: key);

  @override
  State<step3> createState() => _step3State();
}

class _step3State extends State<step3> {
  // List of options
  final List<String> options = [
    'Look Better',
    'Improve Health',
    'Get Shaped',
    'Release Stress',
    'Feel Confident'
  ];

  // Selected option variable
  String? selectedOption;

  // Function to validate the selection
  void _validateAndProceed() {
    if (selectedOption == null) {
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
        MaterialPageRoute(builder: (context) => step4()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            SizedBox(height: 50,),
        Center(child: Text('Goal',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
            SizedBox(height: 16,),
            Center(child: Text('Step: 3',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.green),)),
            SizedBox(height: 16,),
            Center(
              child: Consumer<UserProvider>(
              builder: (context, userProvider, child) {
                return Text("${userProvider.username},What motivates you?",
                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),);
              },
                        ),
            ),
            SizedBox(height: 50,),
            const Text(
              'Please select one of the options below:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Display the options
            ...options.map((option) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOption = option; // Update the selected option
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: selectedOption == option
                        ? Colors.blue.withOpacity(0.2)
                        : Colors.white,
                    border: Border.all(
                      color: selectedOption == option
                          ? Colors.blue
                          : Colors.grey,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    title: Text(
                      option,
                      style: TextStyle(
                        color: selectedOption == option
                            ? Colors.blue
                            : Colors.black,
                        fontWeight: selectedOption == option
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),




            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
    backgroundColor: Colors.teal,
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),),
              onPressed: _validateAndProceed,


              // Validate and navigate
              child: const Text('Next',style: TextStyle(fontSize: 18),),
            ),
          ],
        ),
      ),
    );
  }
}


