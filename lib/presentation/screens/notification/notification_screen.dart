import 'package:app_missing/presentation/provider/missing/notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationProvider = Provider.of<NotificationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notificaciones',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: notificationProvider.notifications.length,
        itemBuilder: (context, index) {
          final notification = notificationProvider.notifications[index];
          return ListTile(
            title: Text(notification.title),
            subtitle: Text(notification.description),
            onTap: () {},
          );
        },
      ),
    );
  }
}
