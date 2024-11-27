import 'package:app_missing/domain/entities/video.dart';
import 'package:app_missing/infraestructure/datasource/video_datasource_impl.dart';
import 'package:app_missing/infraestructure/repositories/video_repository_impl.dart';
import 'package:flutter/material.dart';

class VideoProvider extends ChangeNotifier {
  final VideoRepositoryImpl missingRepo =
      VideoRepositoryImpl(VideoDatasourceImpl());
  List<VideoListEnt> _videoList = [];
  bool _isLoading = true;


  List<VideoListEnt> get videoList => _videoList;
  bool get isLoading => _isLoading;
  
  Future<void> getListVideo(BuildContext context) async {
    _videoList = await missingRepo.getListFounds(1, context);
    _isLoading = false;
    notifyListeners();
  }

  
  void setEmptyList() {
    _videoList = [];
    _isLoading = true;
    notifyListeners();
  }
}
