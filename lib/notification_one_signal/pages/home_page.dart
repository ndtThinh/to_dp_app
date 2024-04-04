import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.amberAccent,
      body: const Center(
        child: Text(
          'Home Page',
          style: TextStyle(fontSize: 30, color: Colors.deepOrange),
        ),
      ),
    );
  }
}
