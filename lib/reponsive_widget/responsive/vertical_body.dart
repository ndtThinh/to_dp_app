import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VerticalBody extends StatelessWidget {
  const VerticalBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vertical'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              height: 200,
              width: 300,
              color: Colors.pink,
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    height: 50,
                    width: 300,
                    color: Colors.amberAccent,
                  );
                }),
          )
        ],
      ),
    );
  }
}
