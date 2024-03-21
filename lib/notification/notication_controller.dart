import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:to_dp_app/main.dart';

class NotificationController {
  /// Sử dụng phương pháp này để phát hiện khi có thông báo hoặc lịch biểu mới được tạo
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Sử dụng phương pháp này để phát hiện mỗi khi có thông báo mới được hiển thị
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Sử dụng phương pháp này để phát hiện xem người dùng có loại bỏ thông báo hay không
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
  }

  /// Sử dụng phương pháp này để phát hiện khi người dùng nhấn vào nút thông báo hoặc hành động
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
  }
}
