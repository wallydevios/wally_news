import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wally_news/presentation/blocs/blocs.dart';
import 'package:wally_news/presentation/shared/widgets/widgets.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  NewsListState createState() => NewsListState();
}

class NewsListState extends State<NewsList> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final news = context.watch<NewsBloc>().state.news;

    if (news.isEmpty) {
      return const Center(
        child: CircularProgressIndicator()
      );
    }


    return BlocListener<NewsBloc, NewsState>(
      listener: (context, state) {
        if (state.shouldResetScroll) {
          _scrollController.animateTo(
            0.0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );

          context.read<NewsBloc>().add(ScrollResetCompletedEvent());
        }
      },
      child: Expanded(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<NewsBloc>().refreshNews();
          },
          child: ListView.builder(
            controller: _scrollController,
            itemCount: context.watch<NewsBloc>().state.news.length,
            itemBuilder: (BuildContext context, int index) {
              return NewItem(context.watch<NewsBloc>().state.news[index]);
            },
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _scrollController.addListener(() {

      if(context.read<NewsBloc>().state.isLoading) {
        return;
      }

      if ((_scrollController.position.pixels + 500) >= _scrollController.position.maxScrollExtent ) {
        context.read<NewsBloc>().loadNextNews();
        print('LLAMANDO');
      }

    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}