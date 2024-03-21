import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/assets.gen.dart';

class HomePageVinHomeCity extends StatefulWidget {
  const HomePageVinHomeCity({super.key});

  @override
  State<HomePageVinHomeCity> createState() => _HomePageVinHomeCityState();
}

class _HomePageVinHomeCityState extends State<HomePageVinHomeCity> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [appBar()],
        ),
      ),
    ));
  }

  Widget appBar() {
    return Stack(
      children: [
        Row(
          children: [
            ClipOval(
              child: Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey),
                child: const Icon(
                  Icons.account_circle_outlined,
                ),
              ),
            ),
            Row(
              children: [

              ],
            )
          ],
        )
      ],
    );
  }
}
