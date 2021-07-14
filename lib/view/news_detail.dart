import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_dummy/model/news_model.dart';
import 'package:intl/intl.dart';

class NewsDetail extends StatefulWidget {
  const NewsDetail({Key? key, this.newsModel}) : super(key: key);

  final NewsModel? newsModel;

  @override
  NewsDetailState createState() => NewsDetailState();
}

class NewsDetailState extends State<NewsDetail> {
  String? currentLargeImage;
  int currentIndexImage = 0;
  List<String> imageListBlock = [];
  @override
  void initState() {
    super.initState();

    currentIndexImage = 0;
    int lenSlide = widget.newsModel?.slideShow?.length ?? 0;
    if (lenSlide > 0) {
      imageListBlock.add(widget.newsModel?.contentThumbnail ?? "");
      for (var element in widget.newsModel!.slideShow!) {
        imageListBlock.add(element);
      }
      currentLargeImage = imageListBlock[0];
    } else {
      currentLargeImage = widget.newsModel?.contentThumbnail ?? "";
    }
  }

  String getDate(String datetime) {
    DateTime date = DateTime.parse(datetime);
    String dateFormat = DateFormat('EEEE, d MMMM yyyy').format(date);

    return dateFormat;
  }

  Widget largeContentImage() {
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: Hero(
        tag: "header",
        child: Image.network(currentLargeImage!),
      ),
    );
  }

  Widget listContentImage() {
    int lenSlide = imageListBlock.length;
    if (lenSlide > 0) {
      return Container(
        width: double.infinity,
        height: 100.0,
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 10.0,
          bottom: 10.0,
        ),
        child: ListView.builder(
          itemCount: lenSlide,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int position) {
            return InkWell(
              onTap: () {
                if (position == currentIndexImage) return;

                setState(() {
                  currentIndexImage = position;
                  currentLargeImage = imageListBlock[currentIndexImage];
                });
              },
              child: currentIndexImage == position
                  ? Container(
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                      padding: const EdgeInsets.all(2.0),
                      child: Image.network(
                        imageListBlock[position],
                        height: 100.0,
                        fit: BoxFit.fill,
                      ),
                    )
                  : Container(
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      padding: const EdgeInsets.all(2.0),
                      child: ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                          Colors.grey,
                          BlendMode.color,
                        ),
                        child: Image.network(
                          imageListBlock[position],
                          height: 100.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
            );
          },
        ),
      );
    } else {
      return const SizedBox(height: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
      ),
      body: Container(
        padding: const EdgeInsets.all(0.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 5.0,
                bottom: 5.0,
              ),
              child: Text(
                widget.newsModel?.title ?? "",
                style: const TextStyle(fontSize: 32.0, color: Colors.black),
                textAlign: TextAlign.left,
                maxLines: 3,
                overflow: TextOverflow.fade,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 20.0,
                bottom: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "By " + (widget.newsModel?.contributorName ?? ""),
                    style: const TextStyle(fontSize: 16.0, color: Colors.pink),
                    textAlign: TextAlign.left,
                    maxLines: 3,
                    overflow: TextOverflow.fade,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    getDate(widget.newsModel?.dateCreated ?? ""),
                    style: const TextStyle(fontSize: 16.0, color: Colors.black),
                    textAlign: TextAlign.left,
                    maxLines: 3,
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            largeContentImage(),
            const SizedBox(
              height: 10.0,
            ),
            listContentImage(),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                widget.newsModel?.content ?? "",
                style: const TextStyle(fontSize: 18.0, color: Colors.black),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
