import 'package:flutter_factory/model/video_model.dart';
import 'package:flutter_factory/repository/video_repository.dart';

class VideoService {
  final VideoRepository _videoRepository = VideoRepository(); // class 정의

  Future<List<VideoModel>> fetchAllVideos() async {
    var response = await _videoRepository.fetchAllVideos(); // document 의 list

    return List<VideoModel>.from(
      (response.data['items'])
          .map((json) => VideoModel.fromJson(json['snippet'])),
    );
  }
}
