import 'package:cloud_firestore/cloud_firestore.dart';

// info : data source 에 접근해서 일단 가져온다. -> 다음단계 repository
Future<QuerySnapshot<Map<String, dynamic>>> getVideos(){
  var videos = FirebaseFirestore.instance.collection("videos").orderBy('name'); // 파이어베이트의 videos 이름의 데이터베이스
  return videos.get(); // 왠지 테이블의 값을 Map 으로 다 가져올거 같다.
}