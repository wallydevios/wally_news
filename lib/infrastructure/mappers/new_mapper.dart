import 'package:wally_news/domain/entities/new.dart';
import 'package:wally_news/infrastructure/models/models.dart';

class NewMapper {
  static New newToNewsApi(NewsApiEntity newsApiEntity) => New(
    title: newsApiEntity.title,
    description: newsApiEntity.description,
    image: newsApiEntity.urlToImage,
    linkToNew: newsApiEntity.url,
    source: newsApiEntity.source.name,
    content: newsApiEntity.content
  );
}
