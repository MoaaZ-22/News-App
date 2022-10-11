import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/styles/themes.dart';
import 'layout/News_Layout/Cubit/cubit.dart';
import 'layout/News_Layout/Cubit/states.dart';
import 'layout/News_Layout/news_layout.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getDataIntoShPre(key: "isDark");
  Bloc.observer = MyBlocObserver();
  runApp(NewsApp(isDark: isDark,));
}

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key, this.isDark}) : super(key: key);
  final bool? isDark;
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness()..changeAppMode(fromShared: isDark),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (BuildContext context, NewsStates state){},
        builder:(BuildContext context, NewsStates state)
        {
          return MaterialApp(
            theme: lightMode,
            darkTheme: darkMode,
            themeMode: (NewsCubit.get(context).isDark == true) ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home:const NewsLayout(),
          );
        },
      ),
    );
  }
}
