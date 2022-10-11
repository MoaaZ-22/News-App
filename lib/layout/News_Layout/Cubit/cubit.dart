import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/News_Layout/Cubit/states.dart';

import '../../../modules/NewsApp/Business/business_screen.dart';
import '../../../modules/NewsApp/Health/health_screen.dart';
import '../../../modules/NewsApp/Sports/sports_screen.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  //Object From News Cubit Can Call Him From Class Name
  static NewsCubit get(context) => BlocProvider.of(context);

  int currantIndex = 0;

  bool isDark = false;

  List<BottomNavigationBarItem> bottomItem =
  [
    const BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.healing), label: 'Health'),
  ];

  List<Widget> newsScreen =
  [
    const BusinessScreen(),
    const SportsScreen(),
    const HealthScreen(),
  ];

  void changeBottomNavBar(int index) {
    currantIndex = index;
    if (index == 1) getSports();
    if (index == 2) getHealth();
    emit(NewsBottomNavStates());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> health = [];
  List<dynamic> search = [];

  void getBusiness() {
    emit(NewsBusinessLoadingState());
    if (business.isEmpty) {
      DioHelper.getData(
        // Method Url
          url: 'v2/top-headlines',
          // quarries as Map (Key : Value)
          query: {
            'country': 'eg',
            'category': 'business',
            'sortBy': 'publishedAt',
            'apiKey': '6c5f2a7e716c421b8d65735170dba649',
          }).then((value) {
        if (kDebugMode) {
          // print(value.data['totalResults']);
          business = value.data['articles'];
          emit(NewsBusinessSuccessState());
        }
      }).catchError((error) {
        if (kDebugMode) {
          emit(NewsBusinessErrorState(error: error));
          print(error.toString());
        }
      });
    }
    else {
      emit(NewsBusinessSuccessState());
    }
  }

  void getSports() {
    // Emit Loading country=eg&category=business&apiKey=6c5f2a7e716c421b8d65735170dba649
    emit(NewsSportsLoadingState());
    if (sports.isEmpty) {
      DioHelper.getData(
        // Method Url
          url: 'v2/top-headlines',
          // quarries as Map (Key : Value)
          query: {
            'country': 'eg',
            'category': 'sports',
            'sortBy': 'publishedAt',
            'apiKey': '6c5f2a7e716c421b8d65735170dba649',
          }).then((value) {
        if (kDebugMode) {
          // print(value.data['totalResults']);
          sports = value.data['articles'];
          // Emit Success
          emit(NewsSportsSuccessState());
        }
      }).catchError((error) {
        if (kDebugMode) {
          // Emit Error
          emit(NewsSportsErrorState(error: error.toString()));
          print(error.toString());
        }
      });
    }
    else {
      emit(NewsSportsSuccessState());
    }
  }

  void getHealth() {
    // Emit Loading
    emit(NewsHealthLoadingState());
    if (health.isEmpty) {
      DioHelper.getData(
        // Method Url
          url: 'v2/top-headlines',
          // quarries as Map (Key : Value)
          query: {
            'country': 'eg',
            'category': 'health',
            'sortBy': 'publishedAt',
            'apiKey': 'ec901a3644644c7385e94a9b7e793565',
          }).then((value) {
        if (kDebugMode) {
          // print(value.data['totalResults']);
          health = value.data['articles'];
          // Emit Success
          emit(NewsHealthSuccessState());
        }
      }).catchError((error) {
        if (kDebugMode) {
          // Emit Error
          emit(NewsHealthErrorState(error: error.toString()));
          print(error.toString());
        }
      });
    }
    else {
      emit(NewsSportsSuccessState());
    }
  }

  void getSearch(String value) {
    // Emit Loading
    emit(NewsSearchLoadingState());
    DioHelper.getData(
        url:'v2/everything',
        query:
        {
          'q':value,
          'apiKey':'ec901a3644644c7385e94a9b7e793565'
        }
        ).then((value)
    {
      search = value.data['articles'];
      emit(NewsSearchSuccessState());
    }).catchError((error)
    {
      if (kDebugMode) {
        print('Error When You Search ${error.toString()}');
        emit(NewsSearchErrorState(error: 'Error When You Search'));
      }
    });
  }

  void changeAppMode({bool? fromShared})
  {
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsAppModeState());
    } else {
      isDark = !isDark;
    }
    CacheHelper.setDataIntoShPre(key: 'isDark', value: isDark).then((value){
      emit(NewsAppModeState());});
  }

}