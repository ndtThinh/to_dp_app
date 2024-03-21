import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_dp_app/test_route/routes/route_name.dart';

class PageTwo extends StatefulWidget {
  final String strArgument;

  const PageTwo({super.key, required this.strArgument});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_outlined),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          color: Colors.yellowAccent,
          child: Center(
            child: TextButton(
                child: Text(
                    "Page Two to Page Three, argument: ${widget.strArgument}"),
                onPressed: () {
                  Navigator.of(context).pushNamed(RouteName.page3);
                }),
          ),
        ));
    ;
  }
}
