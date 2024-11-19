import 'package:flutter/material.dart';
import 'package:app_missing/domain/entities/notification.dart';

class NotificationProvider with ChangeNotifier {
  List<NotificationEnt> _notifications = [];
  List<NotificationEnt> get notifications => _notifications;

  NotificationProvider();

  void addNotification(NotificationEnt notification) {
    _notifications.add(notification);
    notifyListeners();
  }

  void setNotifications(List<NotificationEnt> notifications) {
    _notifications = notifications;
    notifyListeners();
  }

  // Future<void> initialize(String? token) async {
  //   await _repository.initializeNotifications(token);

  //   // Escuchar notificaciones en tiempo real
  //   _repository.listenToUserNotifications().listen((newNotifications) {
  //     _notifications.addAll(newNotifications);
  //     notifyListeners();
  //   });
  // }
}
