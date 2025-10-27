import 'package:flutter/material.dart';
import 'screens/profile_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(ProfileCardApp());
}

class ProfileCardApp extends StatefulWidget {
  @override
  State<ProfileCardApp> createState() => _ProfileCardAppState();
}

class _ProfileCardAppState extends State<ProfileCardApp> {
  ThemeMode themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Card App',
      themeMode: themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile Card App'),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                setState(() {
                  if (value == 'Light') themeMode = ThemeMode.light;
                  else if (value == 'Dark') themeMode = ThemeMode.dark;
                  else themeMode = ThemeMode.system;
                });
              },
              itemBuilder: (context) => [
                PopupMenuItem(value: 'Light', child: Text('Light Mode')),
                PopupMenuItem(value: 'Dark', child: Text('Dark Mode')),
                PopupMenuItem(value: 'System', child: Text('System Mode')),
              ],
              icon: Icon(Icons.more_vert, color: Colors.white),
            ),
          ],
        ),
        body: ProfilePage(),
      ),
    );
  }
}
