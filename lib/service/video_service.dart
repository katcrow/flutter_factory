// info : service layer 는 비즈니스 로직이 포함 됨
// info : 지금은 repository 를 참조만 하는 의미없는 로직이지만 향후 로직처리 시 필요한 layer
import 'package:flutter_factory/model/video_model.dart';
import 'package:flutter_factory/repository/video_repository.dart';

class VideoService {
  final VideoRepository _videoRepository = VideoRepository(); // class 정의

  Future<List<VideoModel>> fetchAllVideos() async {
  // Future<void> fetchAllVideos() async {
    var videos = await _videoRepository.fetchAllVideos(); // document 의 list

    //-- list 를 하나씩 풀어서 model 로 변환
    for(var snapshot in videos){
      // print(snapshot.data());
    }

    return videos.map((snapshot) {
      var videoMap = snapshot.data();
      return VideoModel(videoMap["name"], '');
    }).toList();
  }
}
