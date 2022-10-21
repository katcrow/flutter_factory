class VideoModel {
  String? title;
  String? description;
  String? thumbnail;
  String? publishedDate;

  VideoModel(
    this.title,
    this.description,
    this.thumbnail,
    this.publishedDate,
  );

  VideoModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    description = json["description"];
    publishedDate = json["publishedDate"];
    thumbnail = json["thumbnails"].isNotEmpty
        ? json["thumbnails"]['maxres']['url']
        : 'https://mblogthumb-phinf.pstatic.net/MjAxNzA2MTlfNDgg/MDAxNDk3ODAwMTMzNDIx.GF4RP0mOJpPcemv2CX2cA8b08L23eJ0VFpIKqpAw7jIg.G2-7h3-G5PArRS2WO9MCvAvzFibyHi0M0KJb8r9hTeog.JPEG.kusshand_official/3.jpg?type=w800'; // chk
  }
}