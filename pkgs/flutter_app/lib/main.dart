import 'package:flutter/material.dart';
import 'screens/history_screen.dart';
import 'screens/login_screen.dart';
import 'screens/member_screen.dart';
import 'screens/role_assign_screen.dart';
import 'screens/role_edit_screen.dart';
import 'screens/role_new_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/splits_screen.dart';
import 'screens/transaction_screen.dart';
import 'screens/workspace_list_screen.dart';
import 'screens/role_screen.dart';
import 'screens/workspace_new_screen.dart';
import 'screens/workspace_scaffold_screen.dart';

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
        '/workspace': (context) => const WorkspaceListScreen(),
        '/workspace/new': (context) => const WorkspaceNewScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == null) return null;

        final uri = Uri.parse(settings.name!);
        final pathSegments = uri.pathSegments;

        if (pathSegments.isEmpty) return null;

        // Workspace-related routes
        if (pathSegments.first == 'workspace') {
          if (pathSegments.length == 2) { // e.g., /workspace/123
            final id = pathSegments[1];
            return MaterialPageRoute(builder: (_) => WorkspaceScaffoldScreen(workspaceId: id), settings: settings);
          }
          if (pathSegments.length == 3) { // e.g., /workspace/123/settings
            final id = pathSegments[1];
            final page = pathSegments[2];
            if (page == 'settings') {
              return MaterialPageRoute(builder: (_) => SettingsScreen(workspaceId: id), settings: settings);
            }
            if (page == 'history') {
              return MaterialPageRoute(builder: (_) => HistoryScreen(workspaceId: id), settings: settings);
            }
          }
          if (pathSegments.length == 4 && pathSegments[2] == 'role' && pathSegments[3] == 'new') { // e.g., /workspace/123/role/new
            final id = pathSegments[1];
            return MaterialPageRoute(builder: (_) => RoleNewScreen(workspaceId: id), settings: settings);
          }
          if (pathSegments.length == 5 && pathSegments[2] == 'role') { // e.g., /workspace/123/role/456/edit
            final id = pathSegments[1];
            final roleId = pathSegments[3];
            final action = pathSegments[4];
            if (action == 'edit') {
              return MaterialPageRoute(builder: (_) => RoleEditScreen(workspaceId: id, roleId: roleId), settings: settings);
            }
            if (action == 'assign') {
              return MaterialPageRoute(builder: (_) => RoleAssignScreen(workspaceId: id, roleId: roleId), settings: settings);
            }
          }
        }
        return null;
      },
    );
  }
}
