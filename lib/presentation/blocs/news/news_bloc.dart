import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wally_news/domain/entities/entities.dart';
import 'package:wally_news/domain/repositories/repositories.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {  

  final NewsRepository newsRepository;

  NewsBloc(this.newsRepository) : super(const NewsState()) {
    
    on<PageNumberChangedEvent>((event, emit) {
      emit(state.copyWith(pageNumber: state.pageNumber + 1));
    });

    on<IsLoadingNewsEvent>((event, emit) {
      emit(state.copyWith(isLoading: true));
    });

    on<NewsWasLoadedEvent>((event, emit) {
      emit(state.copyWith(isLoading: false, news: event.news));
    });

    on<MoreNewsWasLoadedEvent>((event, emit) {
      emit(state.copyWith(isLoading: false, news: [...state.news, ...event.news]));
    });

    on<RefreshNewsEvent>((event, emit) {
      emit(state.copyWith(pageNumber: 1));
      loadNews();
    });

    on<CategoryChangedEvent>((event, emit) {
      emit(state.copyWith(selectedCategory: event.category, shouldResetScroll: true, pageNumber: 1));
      loadNews();
    });

    on<ScrollResetCompletedEvent>((event, emit) {
      emit(state.copyWith(shouldResetScroll: false));
    });

    loadNews();

  }

  void onCategoryChanged(Categories category) {
    add(CategoryChangedEvent(category));
  }


  void loadNews() async {
    add(IsLoadingNewsEvent());

    final news = await newsRepository.getNewsByCategory(
      category: state.selectedCategory,
      page: state.pageNumber
    );

    add(NewsWasLoadedEvent(news));
  }

  void loadNextNews() async {
    add(IsLoadingNewsEvent());

    final news = await newsRepository.getNewsByCategory(
      category: state.selectedCategory,
      page: state.pageNumber + 1
    );

    add(MoreNewsWasLoadedEvent(news));
    add(PageNumberChangedEvent());
  }

  void refreshNews() {
    add(RefreshNewsEvent());
  }

}
