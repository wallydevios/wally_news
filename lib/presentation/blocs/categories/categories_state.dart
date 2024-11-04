part of 'categories_bloc.dart';

class CategoriesState extends Equatable {

  final Categories selectedCategory;

  const CategoriesState({this.selectedCategory = Categories.general});
  
  @override
  List<Object> get props => [selectedCategory];

  CategoriesState copyWith(Categories category) => CategoriesState(selectedCategory: category);
}

