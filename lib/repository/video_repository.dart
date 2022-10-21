import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter_factory/data/youtube_api/client.dart';
import 'package:flutter_factory/data/youtube_api/youtube_api.dart';

// info : A useful abstraction layer between services and data
// info : data source    -> repository -> service
// info : raw data(Map)  -> List       -> model 의 형식으로 변환
class VideoRepository {
  late Dio dio;

  VideoRepository() {
    dio = client();
  }

  Future<Response> fetchAllVideos() async {
    // callback function
    return await getYoutubeVideos(dio); // api 호출
  }
}
