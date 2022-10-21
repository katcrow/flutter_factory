import 'package:flutter/material.dart';
import 'package:flutter_factory/model/video_model.dart';

class VideoListTile extends StatelessWidget {
  final VideoModel videoModel;

  const VideoListTile({Key? key, required this.videoModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(1),
      child: Column(
        children: [
          Image.network(videoModel.thumbnail ??
              'https://mblogthumb-phinf.pstatic.net/MjAxNzA2MTlfNDgg/MDAxNDk3ODAwMTMzNDIx.GF4RP0mOJpPcemv2CX2cA8b08L23eJ0VFpIKqpAw7jIg.G2-7h3-G5PArRS2WO9MCvAvzFibyHi0M0KJb8r9hTeog.JPEG.kusshand_official/3.jpg?type=w800'),
          Container(
            color: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'View',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    )),
                // Text(
                //   'View', //videoModel.title ?? 'No Title',
                //   style: const TextStyle(fontSize: 20),
                // ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.star_border,
                      color: Colors.blue,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
