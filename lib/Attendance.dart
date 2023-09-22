import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
final List<String>items=List.generate(20, (index) => '');
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView.builder(
      itemCount: items.length,
      itemBuilder:
      (context, index) {
        return ListTile(
       title:Text('j'),
      );
      }, ));
  }
}