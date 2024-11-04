import 'package:wally_news/domain/entities/entities.dart';
import 'package:wally_news/domain/entities/new.dart';

abstract class NewsDatasource {

  Future<List<New>> getNewsByCategory({Categories category = Categories.general, int page = 1});

}