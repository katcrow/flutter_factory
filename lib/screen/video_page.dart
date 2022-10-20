import 'package:flutter/material.dart';
import 'package:flutter_factory/controller/video_notifier.dart';
import 'package:flutter_factory/model/video_model.dart';
import 'package:provider/provider.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<VideoNotifier, List<VideoModel>>(
      selector: (_, notifier) => notifier.videoList,
      builder: (_, videoList, __) {
        return Container(
          color: Colors.black87,
          child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: videoList.length,
              itemBuilder: (_, index) {
                return Card(
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    child: Text(
                      videoList[index].name,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
