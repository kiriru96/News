class NewsModel {
  final String? id;
  final String? title;
  final String? content;
  final String? contributorName;
  final String? contributorAvatar;
  final String? dateCreated;
  final String? contentThumbnail;
  final List? slideShow;

  NewsModel(
      {this.id,
      this.title,
      this.content,
      this.contributorName,
      this.contributorAvatar,
      this.dateCreated,
      this.contentThumbnail,
      this.slideShow});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    dynamic slideshow = json["slideshow"];
    final listSlideShow = slideshow as List;
    listSlideShow.forEach((element) {
      print(element);
    });

    return NewsModel(
        id: json["id"] as String?,
        dateCreated: json["createdAt"] as String,
        contributorName: json["contributorName"] as String,
        contributorAvatar: json["contributorAvatar"] as String,
        title: json["title"] as String,
        content: json["content"] as String,
        contentThumbnail: json["contentThumbnail"] as String,
        slideShow: listSlideShow);
  }
}
