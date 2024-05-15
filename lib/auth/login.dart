import 'package:flutter/material.dart';
import 'package:fenjoy/user/homeScreen.dart'; // Import your HomeScreen widget

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      backgroundColor: const Color(0xFFFFD101), // Set the background color here
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Login', // Title text
                style: TextStyle(
                  fontFamily: 'Galada', // Set the font family to Galada
                  fontSize: 36, // Set the font size
                  color: Color.fromARGB(255, 0, 0, 0), // Set the text color
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => _login(context),
                child: const Text('Login'),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  // Navigate to the registration page
                },
                child: const Text('Create a new account'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }
}
