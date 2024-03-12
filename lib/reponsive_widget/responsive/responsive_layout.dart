import 'package:flutter/material.dart';

class ResponsiceLayout extends StatelessWidget {
  final Widget verticalBody;
  final Widget HotizonalBody;
  ResponsiceLayout({required this.verticalBody, required this.HotizonalBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      if (constraint.maxWidth < 400) {
        return verticalBody;
      } else {
        return HotizonalBody;
      }
    });
  }
}
