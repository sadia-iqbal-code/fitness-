import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/step1.dart';
import 'package:untitled1/userProvider.dart';

class nameScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Consumer<UserProvider>(builder: (context, userProvider, child) {
          return Text(
            "Hello, ${userProvider.username} I am your fitness planner",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          );
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Please enter your name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Your Name",
                  border: OutlineInputBorder(),
                ),
              ),
          
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Provider.of<UserProvider>(context, listen: false)
                          .setUsername(nameController.text);
                      if (nameController.text.isEmpty) {
                        // Show error message if gender not selected
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Validation Error'),
                            content: const Text('Please write your name.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      } else {
                        // Navigate to the next screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => step1(), // Replace with your next screen
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
          
             
            ],
          ),
        ),
      ),
    );
  }
}
