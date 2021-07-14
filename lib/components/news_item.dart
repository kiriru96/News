import 'package:flutter/material.dart';
import 'package:news_dummy/model/news_model.dart';
import 'package:news_dummy/view/news_detail.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({Key? key, this.newsModel}) : super(key: key);

  final NewsModel? newsModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsDetail(newsModel: newsModel),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: "header",
                child: Image.network(
                  newsModel?.contentThumbnail ?? "",
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;

                    return Container(
                      height: 120.0,
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                        child: LinearProgressIndicator(
                            value: (loadingProgress.expectedTotalBytes != null)
                                ? (loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!.toInt())
                                : null),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                newsModel?.title ?? "",
                style: const TextStyle(fontSize: 28.0, color: Colors.black),
                textAlign: TextAlign.left,
                maxLines: 2,
                overflow: TextOverflow.fade,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
