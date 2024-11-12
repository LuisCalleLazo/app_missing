import 'package:app_missing/domain/entities/notification.dart';
import 'package:app_missing/shared/utils/types.dart';

class NotificationModel extends NotificationEnt {
  NotificationModel({
    required super.id,
    required super.title,
    required super.description,
    required super.type,
    required super.linkAction
  });

  
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] ?? 0,
      description: json['description'] ?? '',
      title: json['title'] ?? '',
      type: json['type'] ?? NotificationType.message,
      linkAction: json['linkAction'] ?? '',
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'description' : description,
      'title' : title,
      'type' : type,
      'linkAction' : linkAction
    };
  }
}
