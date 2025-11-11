import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'screens/signup_screen.dart';
import 'screens/workspace_list_screen.dart'; // Import WorkspaceListScreen

// (CustomColors class definition remains the same)
class CustomColors {
  static const Color backgroundColor = Color(0xFFfffdf8);

  static const MaterialColor yellow = MaterialColor(
    0xFFF8CC4C, // 300
    <int, Color>{
      50: Color(0xFFFDFAE9),
      100: Color(0xFFFCF3C5),
      200: Color(0xFFFBE38D),
      300: Color(0xFFF8CC4C),
      400: Color(0xFFF4B520),
      500: Color(0xFFE49B0E),
      600: Color(0xFFC57609),
      700: Color(0xFF9D530B),
      800: Color(0xFF824211),
      900: Color(0xFF6E3615),
      950: Color(0xFF401B08),
    },
  );

  static const MaterialColor blue = MaterialColor(
    0xFF97CCF9, // 300
    <int, Color>{
      50: Color(0xFFF0F7FE),
      100: Color(0xFFDCECFD),
      200: Color(0xFFC2DFFB),
      300: Color(0xFF97CCF9),
      400: Color(0xFF66B0F4),
      500: Color(0xFF4994EF),
      600: Color(0xFF2D73E3),
      700: Color(0xFF255ED0),
      800: Color(0xFF244DA9),
      900: Color(0xFF224386),
      950: Color(0xFF192A52),
    },
  );

  static const MaterialColor orange = MaterialColor(
    0xFFF0B181, // 300
    <int, Color>{
      50: Color(0xFFFDF6EF),
      100: Color(0xFFFBE9D9),
      200: Color(0xFFF6D1B2),
      300: Color(0xFFF0B181),
      400: Color(0xFFE9884E),
      500: Color(0xFFE36527),
      600: Color(0xFFD55121),
      700: Color(0xFFB13C1D),
      800: Color(0xFF8D311F),
      900: Color(0xFF722B1C),
      950: Color(0xFF3D130D),
    },
  );

  static const MaterialColor skyblue = MaterialColor(
    0xFF79D4E7, // 300
    <int, Color>{
      50: Color(0xFFEEFBFD),
      100: Color(0xFFD5F3F8),
      200: Color(0xFFB0E6F1),
      300: Color(0xFF79D4E7),
      400: Color(0xFF3CB8D4),
      500: Color(0xFF1F97B5),
      600: Color(0xFF1D7D9D),
      700: Color(0xFF1E6680),
      800: Color(0xFF215469),
      900: Color(0xFF204759),
      950: Color(0xFF102E3C),
    },
  );
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toban',
      theme: ThemeData(
        primarySwatch: CustomColors.yellow,
        scaffoldBackgroundColor: CustomColors.backgroundColor,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: CustomColors.yellow,
          accentColor: CustomColors.blue,
          backgroundColor: CustomColors.backgroundColor,
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/workspace': (context) => const WorkspaceListScreen(), // Add workspace route
      },
    );
  }
}

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
