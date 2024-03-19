import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestLife extends StatefulWidget {
  final numberStateFull;
  TestLife({required this.numberStateFull});
  @override
  State<TestLife> createState() => _TestLifeState();
}

class _TestLifeState extends State<TestLife> {
  int number = 0;
  @override
  void initState() {
    super.initState();
    number = widget.numberStateFull;
    print('init number=$number');
  }

  @override
  void didUpdateWidget(covariant TestLife oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("Number change : ${widget.numberStateFull} didUpdateWidget");
    if (widget.numberStateFull != oldWidget.numberStateFull) {
      print("change number");
      number = widget.numberStateFull;
    } else {
      print("not change");
    }
  }

  @override
  Widget build(BuildContext context) {
    print('buid number: $number');
    return Center(
      child: ElevatedButton(
          onPressed: () {
            setState(() {
              print('number: $number setstate');
              number++;
            });
          },
          child: Text("Number: $number")),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print('Dispose number: $number');
  }
}
