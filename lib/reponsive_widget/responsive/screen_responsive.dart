import 'package:flutter/material.dart';
import 'package:to_dp_app/reponsive_widget/responsive/horizontal_body.dart';
import 'package:to_dp_app/reponsive_widget/responsive/responsive_layout.dart';
import 'package:to_dp_app/reponsive_widget/responsive/vertical_body.dart';

class ScreenResponsive extends StatefulWidget {
  const ScreenResponsive({super.key});

  @override
  State<ScreenResponsive> createState() => _ScreenResponsiveState();
}

class _ScreenResponsiveState extends State<ScreenResponsive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiceLayout(
        verticalBody: const VerticalBody(),
        HotizonalBody: const HotizontalBody(),
      ),
    );
  }
}
