import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_factory/data/api/video_api.dart';
import 'package:flutter_factory/model/video_model.dart';

// info : A useful abstraction layer between services and data
// info : data source    -> repository -> service
// info : raw data(Map)  -> List       -> model 의 형식으로 변환
class VideoRepository {
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> fetchAllVideos() async {
    // callback function
    var snapshot = await getVideos();

    // docs : 파이어베이스 테이블의 첫번째 문서(document)
    return snapshot.docs;
  }
}
