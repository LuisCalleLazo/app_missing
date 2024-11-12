import 'package:app_missing/domain/entities/notification.dart';
import 'package:flutter/material.dart';

class NotificationProvider with ChangeNotifier
{
  List<NotificationEnt> _notifications = [];

  List<NotificationEnt> get notifications => _notifications;
  int get notificationCount => _notifications.length;

  void setNotifications(List<NotificationEnt> newNotifications) {
    _notifications = newNotifications;
    notifyListeners();
  }

  void addNotification(NotificationEnt notification) {
    _notifications.add(notification);
    notifyListeners();
  }

  void clearNotifications() {
    _notifications.clear();
    notifyListeners();
  }
}