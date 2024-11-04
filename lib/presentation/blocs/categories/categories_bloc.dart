
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wally_news/domain/entities/entities.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {

  final void Function(Categories category) onCategoryChanged;

  CategoriesBloc({
    required this.onCategoryChanged
  }) : super(const CategoriesState()) {

    on<CategorieSelectedEvent>((event, emit) {
      emit(state.copyWith(event.category));
    });

  }

  void changeCategory(Categories category) {
    add(CategorieSelectedEvent(category));
    onCategoryChanged.call(category);
  }
}
