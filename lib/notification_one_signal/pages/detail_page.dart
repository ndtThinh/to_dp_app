import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final int id;

  const DetailPage({super.key, required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'Detail Page',
            style: TextStyle(fontSize: 30, color: Colors.deepOrange),
          ),
          Text(
            'Id : ${widget.id}',
            style: const TextStyle(fontSize: 30, color: Colors.deepOrange),
          )
        ]),
      ),
    );
  }
}
