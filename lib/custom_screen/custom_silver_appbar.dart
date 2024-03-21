import 'package:flutter/material.dart';
import 'package:to_dp_app/custom_screen/one_ui_nest_scroll_view.dart';

class CustomSilverAppBar extends StatefulWidget {
  const CustomSilverAppBar({super.key});

  @override
  State<CustomSilverAppBar> createState() => _CustomSilverAppBarState();
}

class _CustomSilverAppBarState extends State<CustomSilverAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OneUiNestScrollView(
        expandedHeight: 250,
        expandedWidget: const Text(
          "Contacts",
          style: TextStyle(fontSize: 30),
        ),
        collapseWidget: const Text(
          "Contacts",
          style: TextStyle(fontSize: 20),
        ),
        leadingIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add))
        ],
        boxDecoration: const BoxDecoration(color: Colors.grey),
        sliverList: SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
              ),
              title: Text('Contact $index'),
            );
          }),
        ),
        sliverBackGroundColor: Colors.blue,
      ),
    );
  }
}
