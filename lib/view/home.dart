import 'package:flutter/material.dart';
import 'package:news_dummy/model/apis/api_request.dart';
import 'package:news_dummy/components/news_item.dart';
import 'package:news_dummy/model/news_model.dart';
import 'package:news_dummy/model_view/news_mv.dart';

import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Provider.of<NewsMV>(context, listen: false)
          .fetchNewsData("innocent/newsapp/articles");
    });
  }

  Widget getNewsWidget(BuildContext context, ApiRequest apiRequest) {
    List<NewsModel>? newsList = apiRequest.data as List<NewsModel>?;
    String message = apiRequest.message ?? "";
    switch (apiRequest.status) {
      case Status.LOADING:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case Status.COMPLETED:
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: newsList?.length ?? 0,
          itemBuilder: (BuildContext context, int position) {
            return NewsItem(
              newsModel: newsList![position],
            );
          },
        );
      case Status.ERROR:
        return Center(
          child: Text(message),
        );
      case Status.INITIAL:
      default:
        return const Center(child: Text('News List'));
    }
  }

  @override
  Widget build(BuildContext context) {
    ApiRequest apiRequest = Provider.of<NewsMV>(context).response;
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
      ),
      body: RefreshIndicator(
        child: getNewsWidget(context, apiRequest),
        onRefresh: () => Future.delayed(const Duration(seconds: 3), () {
          Provider.of<NewsMV>(context, listen: false)
              .fetchNewsData("innocent/newsapp/articles");
        }),
      ),
    );
  }
}
