import 'package:flutter/material.dart';
import 'qr.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.white, // Example primary color for dark theme
        scaffoldBackgroundColor: Color.fromARGB(255, 37, 37, 37),
      ),
      title: 'Weather App',
      home: Login(),
      routes: {
        '/login': (context) => Login(), // Add this line
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
