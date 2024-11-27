import 'package:app_missing/domain/entities/video.dart';
import 'package:flutter/material.dart';

abstract class VideoRepository {
  Future<List<VideoListEnt>> getListFounds(int missingId, BuildContext context);
}
