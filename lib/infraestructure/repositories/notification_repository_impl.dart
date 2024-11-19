import 'dart:async';
import 'package:app_missing/domain/entities/notification.dart';
import 'package:app_missing/domain/repositories/notification_repository.dart';
import 'package:app_missing/infraestructure/datasource/notification_datasource_impl.dart';
import 'package:app_missing/shared/utils/types.dart';
class NotificationRepositoryImpl extends NotificationRepository {
  final NotificationDatasourceImpl _dataSource;

  NotificationRepositoryImpl(this._dataSource);

  @override
  Future<void> initializeNotifications(String? token) async {
    await _dataSource.initializeFirebase();
    if (token != null && token.isNotEmpty) {
      await _dataSource.subscribeToUserNotifications(token);
    }
  }

  @override
  Stream<List<NotificationEnt>> listenToUserNotifications() {
    return _dataSource.listenToNotifications().map((remoteMessage) {
      final data = remoteMessage.data;

      // Parseamos los datos del mensaje a una lista de objetos NotificationEnt
      return [
        NotificationEnt(
          id: int.parse(data['id'] ?? '0'),
          title: data['title'] ?? '',
          description: data['description'] ?? '',
          linkAction: data['linkAction'] ?? '',
          type: NotificationType.values.byName(data['type'] ?? 'general'),
        )
      ];
    });
  }

  @override
  Future<void> unsubscribeFromNotifications(String? token) async {
    if (token != null && token.isNotEmpty) {
      await _dataSource.unsubscribeFromUserNotifications(token);
    }
  }
}
