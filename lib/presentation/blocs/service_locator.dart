import 'package:get_it/get_it.dart';
import 'package:wally_news/infrastructure/datasources/datasources.dart';
import 'package:wally_news/infrastructure/repositories/repositories.dart';
import 'package:wally_news/presentation/blocs/blocs.dart';


GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  final newsRepository = getIt.registerSingleton<NewsRepositoryImpl>(NewsRepositoryImpl(NewsApiDatasource()));

  final newsBloc = getIt.registerSingleton(NewsBloc(newsRepository));
  
  getIt.registerSingleton(CategoriesBloc(onCategoryChanged: newsBloc.onCategoryChanged));
}
