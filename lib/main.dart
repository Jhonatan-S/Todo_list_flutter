import 'package:flutter/material.dart';
import 'package:todo/pages/home_page.dart';


void main() {
  return runApp(Todo());
}



class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: HomePage(),
    );
  }
}