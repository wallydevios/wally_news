import 'package:wally_news/domain/datasources/datasources.dart';
import 'package:wally_news/domain/entities/entities.dart';

import 'package:wally_news/domain/repositories/repositories.dart';

class NewsRepositoryImpl extends NewsRepository {

  final NewsDatasource datasource;
  NewsRepositoryImpl(this.datasource);
  
  @override
  Future<List<New>> getNewsByCategory({Categories category = Categories.general, int page = 1}) {
    return datasource.getNewsByCategory(category: category, page: page);
  }

}