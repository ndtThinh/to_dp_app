import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_dp_app/notification_one_signal/models/notification_model.dart';
import 'package:to_dp_app/notification_one_signal/notification_config/constants_page.dart';

class NotificationScreenOneSignal extends StatefulWidget {
  const NotificationScreenOneSignal({super.key});

  @override
  State<NotificationScreenOneSignal> createState() =>
      _NotificationScreenOneSignalState();
}

class _NotificationScreenOneSignalState
    extends State<NotificationScreenOneSignal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                sendNotificationToHome();
              },
              icon: const Icon(Icons.notification_add),
            ),
            const SizedBox(
              width: 50,
            ),
            IconButton(
              onPressed: () {
                sendNotificationToDetail();
              },
              icon: const Icon(
                Icons.notification_add,
                color: Colors.yellow,
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            IconButton(
              onPressed: () {
                sendNotificationToSetting();
              },
              icon: const Icon(
                Icons.notification_add,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendNotificationToHome() async {

    const String url = 'https://api.onesignal.com/notifications';
    const String apiKey =
        'YmViM2U4M2QtNDM0NC00MzNjLTliZDYtY2VmYzdiYjdkZGU2'; // Thay thế bằng REST API Key của bạn từ OneSignal

    Map<String, String> headers = {
      'accept': 'application/json',
      'Authorization': 'Basic $apiKey',
      'content-type': 'application/json'
    };

    NotificationModelPage not =
        NotificationModelPage(typePage: ConstantsPages.home);
    Map<String, dynamic> notData = not.toJson();

    Map<String, dynamic> body = {
      'app_id': 'c5ed1aa7-a580-4842-adc9-19d268609a00',
      // Thay thế bằng App ID của bạn từ OneSignal
      'headings': {
        'en': 'New Notification',
      },
      // Nội dung thông báo
      'contents': {
        'en': 'Go to HomePage',
      },
      // 'included_segments': ['KeyTag'],
      'included_segments': ['All'],
      // 'include_player_ids': ['53165e70-1ba3-46db-b133-f0736e01ac3a'],
      // 'include_subscription_ids' :['b81d4ecf-6dd9-486b-8a84-2d4bf12c77a6'],
      // "include_aliases": {
      //   "external_id": ["ex2"]
      // },

      // Gửi thông báo cho loại các người dùng qua tên segment
      'big_picture':
          'https://cdn.popsww.com/blog/sites/2/2022/02/naruto-co-bao-nhieu-tap.jpg',
      //Ảnh đi kèm
      'data': {'notData': notData}
    };

    Dio dio = Dio();

    dio.post(url, data: body, options: Options(headers: headers))
        .then((response) {
      // Xử lý khi gửi thành công
      print('Notification sent successfully');
      print(response.data);
    }).catchError((error) {
      // Xử lý khi gửi thất bại
      print('Failed to send notification');
      print('Error: $error');
    });
  }

  void sendNotificationToDetail() async {
    const String url = 'https://api.onesignal.com/notifications';
    const String apiKey =
        'YmViM2U4M2QtNDM0NC00MzNjLTliZDYtY2VmYzdiYjdkZGU2'; // Thay thế bằng REST API Key của bạn từ OneSignal

    Map<String, String> headers = {
      'accept': 'application/json',
      'Authorization': 'Basic $apiKey',
      'content-type': 'application/json'
    };


    NotificationModelPage not =
        NotificationModelPage(typePage: ConstantsPages.detail, id: 100);
    Map<String, dynamic> notData = not.toJson();

    Map<String, dynamic> body = {
      'app_id': 'c5ed1aa7-a580-4842-adc9-19d268609a00',
      // Thay thế bằng App ID của bạn từ OneSignal
      'headings': {
        'en': 'New Notification',
      },
      'contents': {
        'en': 'Go to Detail',
      },
      // Nội dung thông báo
      'included_segments': ['All'],
      // Gửi thông báo cho loại các người dùng qua tên seg ment
      'big_picture':
          'https://cdn.popsww.com/blog/sites/2/2022/02/naruto-co-bao-nhieu-tap.jpg',
      //Ảnh đi kèm
      'data': {'notData': notData}
    };

    Dio dio = Dio();

    dio
        .post(url, data: body, options: Options(headers: headers))
        .then((response) {
      // Xử lý khi gửi thành công
      print('Notification sent successfully');
      print(response.data);
    }).catchError((error) {
      // Xử lý khi gửi thất bại
      print('Failed to send notification');
      print('Error: $error');
    });
  }

  void sendNotificationToSetting() async {
    const String url = 'https://api.onesignal.com/notifications';
    const String apiKey =
        'YmViM2U4M2QtNDM0NC00MzNjLTliZDYtY2VmYzdiYjdkZGU2'; // Thay thế bằng REST API Key của bạn từ OneSignal

    Map<String, String> headers = {
      'accept': 'application/json',
      'Authorization': 'Basic $apiKey',
      'content-type': 'application/json'
    };

    // PostModel postNot = PostModel(
    //     userId: 1, id: 1, title: 'Hello Guys', body: 'This is new post');
    //
    // Map<String, dynamic> postData = postNot.toJson();

    NotificationModelPage not =
        NotificationModelPage(typePage: ConstantsPages.setting);
    Map<String, dynamic> notData = not.toJson();

    Map<String, dynamic> body = {
      'app_id': 'c5ed1aa7-a580-4842-adc9-19d268609a00',
      // Thay thế bằng App ID của bạn từ OneSignal
      'headings': {
        'en': 'New Notification',
      },
      'contents': {
        'en': 'Go to setting',
      },
      // Nội dung thông báo
      'included_segments': ['KeyTag'],
      // Gửi thông báo cho loại các người dùng qua tên seg ment
      'big_picture':
          'https://cdn.popsww.com/blog/sites/2/2022/02/naruto-co-bao-nhieu-tap.jpg',
      //Ảnh đi kèm
      'data': {'notData': notData}
    };

    Dio dio = Dio();

    dio
        .post(url, data: body, options: Options(headers: headers))
        .then((response) {
      // Xử lý khi gửi thành công
      print('Notification sent successfully');
      print(response.data);
    }).catchError((error) {
      // Xử lý khi gửi thất bại
      print('Failed to send notification');
      print('Error: $error');
    });
  }
}
