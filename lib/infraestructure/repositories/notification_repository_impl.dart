import 'dart:async';
import 'dart:convert';

import 'package:app_missing/domain/entities/notification.dart';
import 'package:app_missing/domain/repositories/notification_repository.dart';
import 'package:app_missing/infraestructure/datasource/notification_datasource_impl.dart';
import 'package:app_missing/infraestructure/models/missing/notification_model.dart';
import 'package:app_missing/presentation/provider/missing/notification_provider.dart';
import 'package:app_missing/shared/constants/storage_value.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  final NotificationDatasourceImpl _dataSource;
  final NotificationProvider _notificationProvider;

  NotificationRepositoryImpl(this._dataSource, this._notificationProvider);

  @override
  Future<void> initialize() async {
    const storage = FlutterSecureStorage();
    String token = await storage.read(key: StorageKey.getCurrentToken()) ?? "";
    _dataSource.connect(token);

    _dataSource.stream.listen((message) {
      List<dynamic> notificationsJson = jsonDecode(message);
      List<NotificationEnt> notifications = notificationsJson.map((json) {
        return NotificationModel.fromJson(json);
      }).toList();

      // Usamos el Provider para actualizar las notificaciones
      _notificationProvider.setNotifications(notifications);
    });
  }

  @override
  void dispose() {
    _dataSource.disconnect();
  }
}
