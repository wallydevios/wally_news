part of 'news_bloc.dart';

class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class CategoryChangedEvent extends NewsEvent {
  final Categories category;

  const CategoryChangedEvent(this.category);
}

class PageNumberChangedEvent extends NewsEvent {}


class NewsWasLoadedEvent extends NewsEvent {
  final List<New> news;

  const NewsWasLoadedEvent(this.news);
}

class MoreNewsWasLoadedEvent extends NewsEvent {
  final List<New> news;

  const MoreNewsWasLoadedEvent(this.news);
}

class IsLoadingNewsEvent extends NewsEvent {}

class RefreshNewsEvent extends NewsEvent {}

class ScrollResetCompletedEvent extends NewsEvent {}

