import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_dp_app/test_route/navigator_utils.dart';
import 'package:to_dp_app/test_route/routes/route_name.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_outlined),
            onPressed: () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              }
            },
          ),
        ),
        body: Container(
          color: Colors.greenAccent,
          child: Center(
            child: TextButton(
                child: Text(
                  "Page One to Page Two",
                  style: TextStyle(fontSize: 20.sp),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(RouteName.page2, arguments: "Xin chao");
                }),
          ),
        ));
  }
}
