import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HotizontalBody extends StatelessWidget {
  const HotizontalBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horizontal'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Row(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              height: 300,
              width: 400,
              color: Colors.pink,
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    height: 30,
                    width: 100,
                    color: Colors.amberAccent,
                  );
                }),
          )
        ],
      ),
    );
  }
}
