import 'package:flutter/cupertino.dart';
import 'package:news_dummy/model/apis/api_request.dart';
import 'package:news_dummy/model/news_model.dart';
import 'package:news_dummy/model/news_repo.dart';

class NewsMV with ChangeNotifier {
  ApiRequest apiRequest = ApiRequest.initial('Empty data.');

  NewsModel? newsModel;

  ApiRequest get response {
    return apiRequest;
  }

  NewsModel? get news {
    return newsModel;
  }

  Future<void> fetchNewsData(String value) async {
    apiRequest = ApiRequest.loading('Fetching news data');

    notifyListeners();

    try {
      List<NewsModel> newsList = await NewsRepo().fetchNewsList(value);
      apiRequest = ApiRequest.completed(newsList);
    } catch (e) {
      apiRequest = ApiRequest.error(e.toString());
      print(e);
    }
    notifyListeners();
  }

  void setSelectedNews(NewsModel? news) {
    newsModel = news;
    notifyListeners();
  }
}
