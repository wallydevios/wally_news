import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wally_news/domain/entities/entities.dart';
import 'package:wally_news/presentation/blocs/blocs.dart';

class CategoryItem extends StatelessWidget {

  final bool isSelected;
  final Categories category;

  const CategoryItem({super.key, this.isSelected = false, required this.category});

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final categoriesBloc = context.watch<CategoriesBloc>();

    return  GestureDetector(
      onTap: () {
        categoriesBloc.changeCategory(category);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? colorScheme.primary : colorScheme.secondary,
          border: isSelected
            ? Border.all(color: Colors.transparent, width: 2)
            : Border.all(color: colorScheme.primary,  width: 2)
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Row(
          children: [
            Icon(
              getIconForCategory(category),
              color: isSelected ? colorScheme.secondary : colorScheme.primary
            ),
            const SizedBox(width: 5),
            Text(
              getNameForCategory(category),
              style: TextStyle(
                color: isSelected ? colorScheme.secondary : colorScheme.primary,
                fontWeight: FontWeight.w600
              ),
            )
          ],
        ),
      ),
    );
  }
}