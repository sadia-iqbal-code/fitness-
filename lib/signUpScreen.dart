// import 'package:flutter/material.dart';
// import 'package:untitled1/nameScreen.dart';
//
// import 'authenticationService.dart';
//
// class SignupScreen extends StatelessWidget {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final AuthService _authService = AuthService();
//
//   void _signup(BuildContext context) async {
//     try {
//       await _authService.signUp(
//         _emailController.text.trim(),
//         _passwordController.text.trim(),
//       );
//       Navigator.push(context, MaterialPageRoute(builder: (context)=>nameScreen()));
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Successfull')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Sign Up')),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => _signup(context),
//               child: Text('Sign Up'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



import 'forget.dart';
import 'nameScreen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  // Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLogin = true; // Toggle between Login and Signup
  bool _isLoading = false;

  void _submitAuthForm() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    setState(() {
      _isLoading = true;
    });

    try {
      if (_isLogin) {
        // Login
        await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      } else {
        // Signup
        await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      }
Navigator.push(context, MaterialPageRoute(builder: (context)=>NameScreen()));
      // Navigate to the Home Screen or display a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _isLogin ? 'Logged in successfully!' : 'Account created successfully!',
          ),
        ),
      );
    } on FirebaseAuthException catch (error) {
      var message = "An error occurred. Please try again.";
      if (error.message != null) {
        message = error.message!;
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Fitness App",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Stay Fit, Stay Healthy!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.teal),
                ),
                const SizedBox(height: 30),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'Email Address',
                              prefixIcon: Icon(Icons.email),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email.';
                              }
                              if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                                return 'Please enter a valid email.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password.';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters long.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          if (_isLoading)
                            const CircularProgressIndicator()
                          else
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 24,
                                ),
                              ),
                              onPressed:_submitAuthForm,


                              child: Text(
                                _isLogin ? 'Login' : 'Signup',
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _isLogin = !_isLogin;
                              });
                            },
                            child: Text(
                              _isLogin
                                  ? "Don't have an account? Signup"
                                  : "Already have an account? Login",
                              style: const TextStyle(color: Colors.teal),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Theme.of(context).primaryColor),
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
