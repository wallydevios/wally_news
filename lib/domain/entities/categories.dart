import 'package:flutter/material.dart';

enum Categories {
  general,
  business,
  entertainment,
  health,
  science,
  sports,
  technology
}

final Map<Categories, IconData> _categoryIcons = {
  Categories.business: Icons.cases_outlined,
  Categories.entertainment: Icons.movie,
  Categories.general: Icons.public,
  Categories.health: Icons.favorite_outline_rounded,
  Categories.science: Icons.science_outlined,
  Categories.sports: Icons.sports_soccer_outlined,
  Categories.technology: Icons.computer_rounded,
};

IconData getIconForCategory(Categories category) {
  return _categoryIcons[category] ?? Icons.help_outline;
}

final Map<Categories, String> _categoryNames = {
  Categories.business: 'Negocios',
  Categories.entertainment: 'Entretenimiento',
  Categories.general: 'General',
  Categories.health: 'Salud',
  Categories.science: 'Ciencia',
  Categories.sports: 'Deportes',
  Categories.technology: 'Tecnología',
};

String getNameForCategory(Categories category) {
  return _categoryNames[category] ?? 'Desconocido';
}

String getSimpleName(Categories category) {
  return category.toString().split('.').last;
}
