import 'package:app_missing/shared/utils/types.dart';

class NotificationEnt {
  final int id;
  final String title;
  final String description;
  final String linkAction;
  final NotificationType type;

  NotificationEnt({
    required this.id,
    required this.title,
    required this.description,
    required this.linkAction,
    required this.type,
  });
}
