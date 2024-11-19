import 'package:app_missing/domain/datasource/notification_datasource.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationDatasourceImpl extends NotificationDatasource {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  Future<void> initializeFirebase() async {
    await _firebaseMessaging.requestPermission();
    String? fcmToken = await _firebaseMessaging.getToken();
    // print('FCM Token: $fcmToken');
  }

  @override
  Stream<RemoteMessage> listenToNotifications() {
    // Escucha notificaciones en tiempo real mientras la app está en primer plano
    return FirebaseMessaging.onMessage;
  }

  @override
  Future<void> subscribeToUserNotifications(String token) async {
    await _firebaseMessaging.subscribeToTopic("user_$token");
  }

  @override
  Future<void> unsubscribeFromUserNotifications(String token) async {
    await _firebaseMessaging.unsubscribeFromTopic("user_$token");
  }
}
