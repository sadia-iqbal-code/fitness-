import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/step7.dart';
import 'package:untitled1/userProvider.dart';
class step6 extends StatefulWidget {
  const step6({super.key});

  @override
  State<step6> createState() => _step6State();
}

class _step6State extends State<step6> {
  String? selectedAge;
  final List<String> ageList = List.generate(100, (index) => (index + 1).toString());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          SizedBox(height: 50,),
          Text('Goal',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          SizedBox(height: 16,),
          Text('Step: 6',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          SizedBox(height: 16,),
          Consumer<UserProvider>(
            builder: (context, userProvider, child) {
              return Text("${userProvider.username},What is your current age?",
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
    Text(
    "How Old Are You?",
    style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
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
    value: selectedAge,
    isExpanded: true,
    hint: Text("Select Your Age"),
    style: TextStyle(fontSize: 18, color: Colors.black87),
    items: ageList.map((age) {
    return DropdownMenuItem(
    value: age,
    child: Text(age),
    );
    }).toList(),
    onChanged: (value) {
    setState(() {
    selectedAge = value;
    });
    },
    ),
    ),
    ),
    SizedBox(height: 30),
    ElevatedButton(
    onPressed: () {
    if (selectedAge != null) {
    showDialog(
    context: context,
    builder: (context) => AlertDialog(
    title: Text(
    "Age Selected",
    style: TextStyle(fontWeight: FontWeight.bold),
    ),
    content: Text(
    "You selected age: $selectedAge",
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
    content: Text("Please select an age!"),
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
    backgroundColor: Colors.purpleAccent,
    elevation: 5,
    ),
    child: Text(
    "Submit Age",
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
    ),

    ),
    if (selectedAge != null)  ...[
    SizedBox(height: 40),
    Text(
    "Your Age: $selectedAge",
    style: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.white,
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
              child: Text("Next",style: TextStyle(color: Colors.black,fontSize: 18),),
            ),
          )

        ],

    )
    );
    }
  // Function to validate the selection
  void validateAndProceed() {
    if (selectedAge == null) {
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
        MaterialPageRoute(builder: (context) => step7()),
      );
    }
  }
    }



    // Text(
    // "Select Your Age:",
    // style: TextStyle(fontSize: 18),
    // ),
    // SizedBox(height: 10),
    // DropdownButton<String>(
    // value: selectedAge,
    // isExpanded: true,
    // hint: Text("Choose age"),
    // items: List.generate(100, (index) {
    // final age = (index + 1).toString(); // Age starts from 1
    // return DropdownMenuItem(
    // value: age,
    // child: Text(age),
    // );
    // }),
    // onChanged: (value) {
    // setState(() {
    // selectedAge = value; // Update selected age
    // });
    // },
    // ),
    // SizedBox(height: 20),
    // ElevatedButton(
    // onPressed: () {
    // if (selectedAge != null) {
    // // Show a dialog with the selected age
    // showDialog(
    // context: context,
    // builder: (context) => AlertDialog(
    // title: Text("Age Selected"),
    // content: Text("You selected age: $selectedAge"),
    // actions: [
    // TextButton(
    // onPressed: () {
    // Navigator.pop(context);
    // },
    // child: Text("OK"),
    // ),
    // ],
    // ),
    // );
    // } else {
    // // Show a message if no age is selected
    // ScaffoldMessenger.of(context).showSnackBar(
    // SnackBar(
    // content: Text("Please select an age"),
    // duration: Duration(seconds: 2),
    // ),
    // );
    // }
    // },
    // child: Text("Submit Age"),
    // ),
    // ],
    // ),
    // );
    // }
    // }
    //
    //
    //
    //
    //
