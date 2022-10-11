abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavStates extends NewsStates{}

 // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Business

class NewsBusinessLoadingState extends NewsStates{}

class NewsBusinessSuccessState extends NewsStates{}

class NewsBusinessErrorState extends NewsStates{
  final String error;

  NewsBusinessErrorState({required this.error});
}

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Sports

class NewsSportsLoadingState extends NewsStates{}

class NewsSportsSuccessState extends NewsStates{}

class NewsSportsErrorState extends NewsStates{
  final String error;

  NewsSportsErrorState({required this.error});
}

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Health

class NewsHealthLoadingState extends NewsStates{}

class NewsHealthSuccessState extends NewsStates{}

class NewsHealthErrorState extends NewsStates{
  final String error;

  NewsHealthErrorState({required this.error});
}

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Dark and Light Mode

class NewsSearchLoadingState extends NewsStates{}

class NewsSearchSuccessState extends NewsStates{}

class NewsSearchErrorState extends NewsStates{
  final String error;

  NewsSearchErrorState({required this.error});
}

// ********************************************** Change Mode *******************************************************************

class NewsAppModeState extends NewsStates{}