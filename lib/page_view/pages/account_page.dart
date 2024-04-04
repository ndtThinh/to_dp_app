import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountPageView extends StatefulWidget {
  const AccountPageView({super.key});

  @override
  State<AccountPageView> createState() => _AccountPageViewState();
}

class _AccountPageViewState extends State<AccountPageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellowAccent,
      child: const Center(
        child: Text("Account Page"),
      ),
    );
  }
}
