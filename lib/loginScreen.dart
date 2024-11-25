import 'package:flutter/material.dart';
import 'authenticationService.dart';

    class LoginScreen extends StatefulWidget {
    @override
    _LoginScreenState createState() => _LoginScreenState();
    }

    class _LoginScreenState extends State<LoginScreen> {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final AuthService _authService = AuthService();

    void _login() async {
    try {
    await _authService.signIn(
    _emailController.text.trim(),
    _passwordController.text.trim(),
    );
    Navigator.pushNamed(context, '/home');
    } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Successfull')),
    );
    }
    }

    @override
    Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text('Login')),
    body: Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    TextField(
    controller: _emailController,
    decoration: InputDecoration(labelText: 'Email'),
    ),
    TextField(
    controller: _passwordController,
    decoration: InputDecoration(labelText: 'Password'),
    obscureText: true,
    ),
    SizedBox(height: 20),
    ElevatedButton(
    onPressed: _login,
    child: Text('Login'),
    ),
    TextButton(
    onPressed: () => Navigator.pushNamed(context, '/signup'),
    child: Text('Create Account'),
    ),
    ],
    ),
    ),
    );
    }
    }
