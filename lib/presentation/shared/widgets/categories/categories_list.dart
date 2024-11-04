import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wally_news/domain/entities/entities.dart';
import 'package:wally_news/presentation/blocs/blocs.dart';
import 'package:wally_news/presentation/shared/widgets/widgets.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {

    final categoriesBloc = context.watch<CategoriesBloc>();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.only(left:10),
        child: Row(
          children: Categories.values.map((category) {
            return CategoryItem(
              isSelected: category == categoriesBloc.state.selectedCategory,
              category: category,
            );
          }).toList(),
        ),
      ),
    );
  }
}
