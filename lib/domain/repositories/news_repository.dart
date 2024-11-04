import 'package:wally_news/domain/entities/entities.dart';
import 'package:wally_news/domain/entities/new.dart';

abstract class NewsRepository {

  Future<List<New>> getNewsByCategory({Categories category = Categories.general, int page = 1});

}