import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:to_dp_app/notification_one_signal/pages/detail_page.dart';
import 'package:to_dp_app/notification_one_signal/pages/home_page.dart';
import 'package:to_dp_app/notification_one_signal/pages/setting_page.dart';

import '../../clean_archi/domain/entity/post_entityl.dart';
import '../detail_notification_screen.dart';
import '../navigatior_utils.dart';
import 'constants_page.dart';

class NotificationConfig {
  static void initNotification() {
    //khởi tạo
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.initialize("c5ed1aa7-a580-4842-adc9-19d268609a00");
    OneSignal.Notifications.requestPermission(true);
    // OneSignal.User.addTags({'KeyTag': 'key'});

    //bắt sự kiện click noti
    OneSignal.Notifications.addClickListener((event) {
      print(
          'NOTIFICATION CLICK LISTENER CALLED WITH EVENT: ${event.notification.additionalData}');
      Map<String, dynamic>? additionalData = event.notification.additionalData;

      if (additionalData != null) {
        print('additionalData notData : ${additionalData!['notData']}');

        dynamic jsonData = additionalData!['notData'];
        int typePage = jsonData['typePage'];

        switch (typePage) {
          case ConstantsPages.home:
            NavigationUtils.navigatorKey.currentState?.push(
                MaterialPageRoute(builder: (context) => const HomePage()));
          case ConstantsPages.detail:
            int id = jsonData['id'];
            if (id != null) {
              NavigationUtils.navigatorKey.currentState?.push(MaterialPageRoute(
                  builder: (context) => DetailPage(
                        id: id,
                      )));
            }
            break;
          case ConstantsPages.setting:
            NavigationUtils.navigatorKey.currentState?.push(
                MaterialPageRoute(builder: (context) => const SettingPage()));
            break;
        }
      }
    });
  }
}
