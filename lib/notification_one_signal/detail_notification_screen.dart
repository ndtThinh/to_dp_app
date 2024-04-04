import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_dp_app/clean_archi/domain/entity/post_entityl.dart';

class DetailNotification extends StatefulWidget {
  final PostModel postModel;

  const DetailNotification(
      {super.key, required this.postModel});

  @override
  State<DetailNotification> createState() => _DetailNotificationState();
}

class _DetailNotificationState extends State<DetailNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(),
      body: Center(
        child: Container(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.postModel.title ?? "title error",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  widget.postModel.body ?? 'body error',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            )),
      ),
    );
  }
}
