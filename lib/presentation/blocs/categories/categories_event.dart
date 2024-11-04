part of 'categories_bloc.dart';

class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

class CategorieSelectedEvent extends CategoriesEvent {
  final Categories category;

  const CategorieSelectedEvent(this.category);
}