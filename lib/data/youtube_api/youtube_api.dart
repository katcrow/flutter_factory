import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

Future<Response> getYoutubeVideos(Dio client) async {
  final jsonString = await rootBundle.loadString("assets/json/secrets.json");
  final data = json.decode(jsonString); // dynamic , 아마 Map 일 듯

  String apiKey = data['api_key']; // Map 에서 'api_key' 에 해당하는 value
  return client.get('/playlistItems', queryParameters: {
    'key': apiKey,
    'playlistId': 'PLDr7Z-9oq6555ISGuDLic7nA8qKv4n_Gj',
    'part': 'snippet',
    'maxResults' : 50, // 최대 가져오는 건수
  });
}
