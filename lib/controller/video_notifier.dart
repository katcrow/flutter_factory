import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_factory/service/video_service.dart';
import '../model/video_model.dart';

class VideoNotifier extends ChangeNotifier {
  List<VideoModel> _videoList = [];

  List<VideoModel> get videoList => _videoList; // getter

  final VideoService _videoService = VideoService();

  Future<void> fetchAllVideos() async {
    _videoList = await _videoService.fetchAllVideos();
    notifyListeners(); // state, setState() , update()
  }
}
