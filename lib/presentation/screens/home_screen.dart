import 'package:flutter/material.dart';
import 'package:wally_news/presentation/shared/widgets/categories/categories_list.dart';
import 'package:wally_news/presentation/shared/widgets/news/news_list.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('WallyNews'),
      ),
      body: const Column(
        children: [
          CategoriesList(),
          NewsList()
        ],
      )
    );
  }

}
