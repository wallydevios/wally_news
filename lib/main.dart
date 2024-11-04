import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wally_news/presentation/screens/screens.dart';

import '/presentation/blocs/blocs.dart';
import '/config/config.dart';
import 'presentation/blocs/service_locator.dart';

void main() async {
  await dotenv.load();
  serviceLocatorInit();
  runApp(const BlocsProvider());
}

class BlocsProvider extends StatelessWidget {
  const BlocsProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CategoriesBloc>()),
        BlocProvider(create: (context) => getIt<NewsBloc>()),
      ],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().appTheme(),
      darkTheme: AppTheme().appDarkTheme(),
      home: const HomeScreen(),
    );
  }
}
