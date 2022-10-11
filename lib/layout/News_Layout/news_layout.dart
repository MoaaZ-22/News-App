import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/NewsApp/Search/search_screen.dart';
import '../../shared/components/components.dart';
import 'Cubit/cubit.dart';
import 'Cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, NewsStates status) {},
      builder: (BuildContext context, NewsStates status) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  icon: const Icon(
                    Icons.search,
                  ),
                  onPressed: () {
                    navigateTo(context, const SearchScreen());
                  }),
              IconButton(
                  icon: const Icon(
                    Icons.brightness_4_rounded,
                  ),
                  onPressed: () {
                    NewsCubit.get(context).changeAppMode();
                  })
            ],
            title: const Text('News App'),
          ),
          body: cubit.newsScreen[cubit.currantIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItem,
            currentIndex: cubit.currantIndex,
            onTap: (index) {
              return cubit.changeBottomNavBar(index);
            },
          ),
        );
      },
    );
  }
}
