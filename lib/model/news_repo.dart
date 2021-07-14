import 'package:news_dummy/model/news_model.dart';
import 'package:news_dummy/model/services/base_service.dart';
import 'package:news_dummy/model/services/news_service.dart';

class NewsRepo {
  BaseService newsService = NewsService();

  Future<List<NewsModel>> fetchNewsList(String value) async {
    dynamic response = await newsService.getResponse(value);
    final jsonData = response as List;

    List<NewsModel> newsModelList =
        jsonData.map((tagJson) => NewsModel.fromJson(tagJson)).toList();

    return newsModelList;
  }
}
