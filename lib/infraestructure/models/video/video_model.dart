import 'package:app_missing/domain/entities/video.dart';

class VideoModel extends VideoListEnt {
  VideoModel(
      {required super.id,
      required super.date,});

  factory VideoModel.toModel(VideoListEnt object) {
    return VideoModel(
      id: object.id,
      date: object.date,
    );
  }

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'] ?? 0,
      date: json['date']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date
    };
  }
}
