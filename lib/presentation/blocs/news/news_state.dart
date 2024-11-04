part of 'news_bloc.dart';

class NewsState extends Equatable {

  final bool isLoading;
  final Categories selectedCategory;
  final List<New> news;
  final int pageNumber;
  final bool shouldResetScroll;

  const NewsState({
    this.isLoading = false,
    this.selectedCategory = Categories.general,
    this.news = const [],
    this.pageNumber = 1,
    this.shouldResetScroll = false
  });
  
  @override
  List<Object> get props => [selectedCategory, news, pageNumber];

  NewsState copyWith({
    bool? isLoading,
    Categories? selectedCategory,
    List<New>? news,
    int? pageNumber,
    bool? shouldResetScroll
  }) => NewsState(
    isLoading: isLoading ?? this.isLoading,
    selectedCategory: selectedCategory ?? this.selectedCategory,
    news: news ?? this.news,
    pageNumber: pageNumber ?? this.pageNumber,
    shouldResetScroll: shouldResetScroll ?? this.shouldResetScroll
  );
}

