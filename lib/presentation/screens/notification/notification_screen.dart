// import 'package:app_missing/domain/entities/notification.dart';
// import 'package:app_missing/infraestructure/repositories/notification_repository_impl.dart';
// import 'package:app_missing/presentation/provider/missing/notification_provider.dart';
// import 'package:app_missing/presentation/widgets/card/card_notification_dev.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    // return Consumer<NotificationRepositoryImpl>(
    //   builder: (context, notificationRepo, child) {
    //     List<NotificationEnt> notifications =
    //         NotificationProvider().notifications;

    //     return Scaffold(
    //       appBar: AppBar(
    //         title: Text(
    //             'Notifications (${NotificationProvider().notificationCount})'), // Mostrar el conteo
    //       ),
    //       body: notifications.isEmpty
    //           ? const Center(child: Text("No new notifications."))
    //           : ListView.builder(
    //               itemCount: notifications.length,
    //               itemBuilder: (context, index) {
    //                 NotificationEnt notification = notifications[index];
    //                 return CardNotificationDev(notification: notification);
    //               },
    //             ),
    //     );
    //   },
    // );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notificaciones",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
    );
  }
}
