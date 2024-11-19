import 'package:app_missing/domain/entities/notification.dart';

abstract class NotificationRepository {
  Future<void> initializeNotifications(String? token);
  Stream<List<NotificationEnt>> listenToUserNotifications();
  Future<void> unsubscribeFromNotifications(String? token);
}
