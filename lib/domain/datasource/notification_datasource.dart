import 'package:firebase_messaging/firebase_messaging.dart';

abstract class NotificationDatasource {
  Future<void> initializeFirebase();
  Stream<RemoteMessage> listenToNotifications();
  Future<void> subscribeToUserNotifications(String token);
  Future<void> unsubscribeFromUserNotifications(String token);
}
