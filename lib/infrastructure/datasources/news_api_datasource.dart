

import 'package:dio/dio.dart';
import 'package:wally_news/config/config.dart';
import 'package:wally_news/domain/datasources/datasources.dart';
import 'package:wally_news/domain/entities/categories.dart';
import 'package:wally_news/domain/entities/new.dart';
import 'package:wally_news/infrastructure/mappers/new_mapper.dart';
import 'package:wally_news/infrastructure/models/newsApi/get_news_by_category_response.dart';

class NewsApiDatasource extends NewsDatasource {

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org/v2/',
      headers: {
        'Authorization' : Environment.newsApiKey
      }
    )  
  );

  @override
  Future<List<New>> getNewsByCategory({Categories category = Categories.general, int page = 1}) async {

    final response = await dio.get(
      '/top-headlines',
      queryParameters: {
        'category' : getSimpleName(category),
        'pageSize' : 15,
        'page' : '$page'
      }
    );

    if (response.statusCode != 200) {
      // TODO: IMPLEMENTAR ERROR
    }

    final newsApiNews = GetNewsByCategoryResponse.fromJson(response.data);
    final List<New> news = newsApiNews.articles
    .where(
      (newsApiNew) => newsApiNew.title != '[Removed]'
    )
    .where(
      (newsApiNew) => newsApiNew.description != 'no-description'
    )
    .where(
      (newsApiNew) => newsApiNew.urlToImage != 'no-image'
    )
    .map(
      (item) => NewMapper.newToNewsApi(item)
    ).toList();

    return news;
  }
  
}