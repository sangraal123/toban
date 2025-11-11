import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 160,
                        child: SvgPicture.asset(
                          'assets/images/toban-logo.svg',
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Toban -当番-',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF374151), // gray-800
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to workspace and remove all previous routes
                  Navigator.of(context).pushNamedAndRemoveUntil('/workspace', (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Login'),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to signup screen
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text("Don't have an account? Sign Up"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
