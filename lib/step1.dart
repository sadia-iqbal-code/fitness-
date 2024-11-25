//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:untitled1/step2.dart';
// import 'package:untitled1/userProvider.dart';
//
// class step1 extends StatefulWidget {
//
//   const step1({super.key});
//
//   @override
//   State<step1> createState() => _step1State();
// }
//
// class _step1State extends State<step1> {
//   String? selectedGender;
//   @override
//   Widget build(BuildContext context) {
//
//     return SafeArea(
//       child: Scaffold(
//
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(children: [
//             SizedBox(
//               height: 40,
//             ),
//
//             Text(
//               'Goal',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             ),
//             Text(
//               'Step : 1',
//               style: TextStyle(fontSize: 18, color: Colors.green,fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Consumer<UserProvider>(
//     builder: (context, userProvider, child) {
//       return Text("${userProvider.username},Choose your gender please",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),);
//     } ),
//             SizedBox(
//               height: 30,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 370),
//               child: Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedGender = 'Male';
//                       });
//                     },
//                     child: Center(
//                       child: Row(
//                         children: [
//                           Container(
//                             color: selectedGender == 'Male'
//                                 ? Colors.blue
//                                 : Colors.grey[300],
//                             child: Container(
//                               width: 50,
//                               height: 100,
//                               child: Center(
//                                 child: Text(
//                                   'Male',
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     color: selectedGender == 'Male'
//                                         ? Colors.purpleAccent
//                                         : Colors.black,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 30,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedGender = 'Female';
//                       });
//                     },
//                     child: Center(
//                       child: Container(
//                         color: selectedGender == 'Female'
//                             ? Colors.pink
//                             : Colors.grey[300],
//                         child: Container(
//                           width: 50,
//                           height: 100,
//                           child: Center(
//                             child: Text(
//                               'Female',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 color: selectedGender == 'Female'
//                                     ? Colors.purpleAccent
//                                     : Colors.black,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//
//                 ],
//               ),
//
//             ),
// SizedBox(height: 200,),
// ElevatedButton(onPressed: (){
//
//   Navigator.push(context, MaterialPageRoute(builder: (context)=>step2()));
//
// }, child: Text('Next',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,color: Colors.black),))
//
//           ]),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/step2.dart';
import 'package:untitled1/userProvider.dart';

class step1 extends StatefulWidget {
  const step1({Key? key}) : super(key: key);

  @override
  _step1State createState() => _step1State();
}

class _step1State extends State<step1> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Your Gender'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 30,
            ),

            Text(
              'Goal',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              'Step : 1',
              style: TextStyle(fontSize: 18, color: Colors.green,fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Consumer<UserProvider>(
    builder: (context, userProvider, child) {
      return Text("${userProvider.username},Choose your gender please",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),);
    } ),
Spacer(),
           // SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.only(bottom: 220),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Male Option
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = 'Male';
                    });
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor:
                          selectedGender == 'Male' ? Colors.blue : Colors.grey,
                          child: Icon(
                            Icons.male,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Male',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                // Female Option
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = 'Female';
                    });
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: selectedGender == 'Female'
                            ? Colors.pink
                            : Colors.grey,
                        child: Icon(
                          Icons.female,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Female',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: ElevatedButton(
              onPressed: () {
                if (selectedGender == null) {
                  // Show error message if gender not selected
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Validation Error'),
                      content: const Text('Please select your gender.'),
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
                      builder: (context) => step2(), // Replace with your next screen
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
        ],
      ),
    );
  }
}
