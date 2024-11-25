//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:untitled1/step6.dart';
// import 'package:untitled1/userProvider.dart';
//
//     class step5 extends StatefulWidget {
//       @override
//       _step5State createState() => _step5State();
//     }
//
//     class _step5State extends State<step5> {
//       final TextEditingController feetController = TextEditingController();
//       final TextEditingController inchesController = TextEditingController();
//       final TextEditingController weightController = TextEditingController();
//       double? bmi;
//       String? message;
//
//       void calculateBMI() {
//         int feet = int.tryParse(feetController.text) ?? 0;
//         int inches = int.tryParse(inchesController.text) ?? 0;
//         double weight = double.tryParse(weightController.text) ?? 0.0;
//
//         // Convert feet and inches to meters
//         int totalInches = (feet * 12) + inches;
//         double heightInMeters = totalInches * 0.0254;
//
//         if (heightInMeters > 0 && weight > 0) {
//           setState(() {
//             bmi = weight / (heightInMeters * heightInMeters);
//             message = getBMIMessage(bmi!);
//           });
//         } else {
//           setState(() {
//             bmi = null;
//             message = null;
//           });
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("Please enter valid height and weight")),
//           );
//         }
//       }
//
//       String getBMIMessage(double bmi) {
//         if (bmi < 18.5) {
//           return "You are underweight. Consider a balanced diet and consult a healthcare provider.";
//         } else if (bmi >= 18.5 && bmi <= 24.9) {
//           return "Your BMI is normal. Keep maintaining a healthy lifestyle!";
//         } else if (bmi >= 25.0 && bmi <= 29.9) {
//           return "You are overweight. Consider regular exercise and a balanced diet.";
//         } else {
//           return "You are obese. Consult a healthcare provider for personalized advice.";
//         }
//       }
//
//       @override
//       Widget build(BuildContext context) {
//         return Scaffold(
//
//           body: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//
//
//
//                 SizedBox(height: 50,),
//                 Center(child: Text('Goal',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
//                 SizedBox(height: 20,),
//                 Center(child: Text('Step: 5',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.green),)),
//                 SizedBox(height: 20,),
//
//
//
//                 Consumer<UserProvider>(
//                   builder: (context, userProvider, child) {
//                     return Center(
//                       child: Text("${userProvider.username},Enter your height and weight",
//                         style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
//                     );
//                   },
//                 ),
//
//                 SizedBox(height: 30),
//
//
//                 TextField(
//                   controller: feetController,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     labelText: "Height (feet)",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 TextField(
//                   controller: inchesController,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     labelText: "Height (inches)",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 TextField(
//                   controller: weightController,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     labelText: "Weight (kg)",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 TextButton(
//                   onPressed: calculateBMI,
//                   child: Text("Click Here To Calculate Your BMI",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
//                 ),
//                 SizedBox(height: 20),
//                 if (bmi != null)
//                   Column(
//                     children: [
//                       Text(
//                         "Your BMI is: ${bmi!.toStringAsFixed(2)}",
//                         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(height: 12),
//                       Text(
//                         message ?? "",
//                         style: TextStyle(fontSize: 20, color: Colors.black87,fontWeight: FontWeight.bold),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//
//                 const Spacer(),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.teal,
//                     padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),),
//                   onPressed: (){
//                     if(feetController.text.isEmpty
//                     || weightController.text.isEmpty
//                     || weightController.text.isEmpty) { showDialog(
//                     context: context,
//                     builder: (context) => AlertDialog(
//                     title: const Text('Validation Error'),
//                     content: const Text('Please fill all fields.'),
//                     actions: [
//                     TextButton(
//                     onPressed: () {
//                     Navigator.of(context).pop();
//                     },
//                     child: const Text('OK'),
//                     ),
//                     ],
//                     ),
//                     );
//                     } else {
//                     // Navigate to the next screen
//                     Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                     builder: (context) => step6(), // Replace with your next screen
//                     ),
//                     );
//                     }
//                   }, child: Text('Next'),)
//
//
//
//
//
//
//
//                   // Validate and navigate
//
//
//
//
//               ],
//             ),
//           ),
//         );
//       }
//     }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/step6.dart';
import 'package:untitled1/userProvider.dart';

class Step5 extends StatefulWidget {
  @override
  _Step5State createState() => _Step5State();
}

class _Step5State extends State<Step5> {
  final TextEditingController feetController = TextEditingController();
  final TextEditingController inchesController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  double? bmi;
  String? message;

  void calculateBMI() {
    int feet = int.tryParse(feetController.text) ?? 0;
    int inches = int.tryParse(inchesController.text) ?? 0;
    double weight = double.tryParse(weightController.text) ?? 0.0;

    // Convert feet and inches to meters
    int totalInches = (feet * 12) + inches;
    double heightInMeters = totalInches * 0.0254;

    if (heightInMeters > 0 && weight > 0) {
      setState(() {
        bmi = weight / (heightInMeters * heightInMeters);
        message = getBMIMessage(bmi!);
      });
    } else {
      setState(() {
        bmi = null;
        message = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter valid height and weight")),
      );
    }
  }

  String getBMIMessage(double bmi) {
    if (bmi < 18.5) {
      return "You are underweight. Consider a balanced diet and consult a healthcare provider.";
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return "Your BMI is normal. Keep maintaining a healthy lifestyle!";
    } else if (bmi >= 25.0 && bmi <= 29.9) {
      return "You are overweight. Consider regular exercise and a balanced diet.";
    } else {
      return "You are obese. Consult a healthcare provider for personalized advice.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30),
                const Center(
                  child: Text(
                    'Goal',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    'Step: 5',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ),
                const SizedBox(height: 20),
                Consumer<UserProvider>(
                  builder: (context, userProvider, child) {
                    return Center(
                      child: Text(
                        "${userProvider.username}, Enter your height and weight",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: feetController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Height (feet)",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: inchesController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Height (inches)",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Weight (kg)",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: calculateBMI,
                  child: const Text(
                    "Click Here To Calculate Your BMI",
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                if (bmi != null)
                  Column(
                    children: [
                      Text(
                        "Your BMI is: ${bmi!.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        message ?? "",
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                  ),
                  onPressed: () {
                    if (feetController.text.isEmpty ||
                        weightController.text.isEmpty ||
                        inchesController.text.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Validation Error'),
                          content: const Text('Please fill all fields.'),
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
                          builder: (context) =>
                              step6(), // Replace with your next screen
                        ),
                      );
                    }
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


