
import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/intities/news.dart';
import '../../domain/usecases/news_usecase.dart';
import 'news_state.dart';
class NewsCubit extends Cubit<NewsState>{
  final GetNewsUseCase getNewsUseCase;
  NewsCubit({required this.getNewsUseCase}):super(NewsInitState());
  static NewsCubit get(context)=>BlocProvider.of(context);

  Future<Void?> getData ()async{
    emit(LoadingNewsState());
    try {
      List<News> listData = await getNewsUseCase.call();
      emit(SuccessNewsState(listData: listData));
    }catch(e){
      emit(ErrorNewsState(error: 'Error in get data'));
    }
}
   Future<void>refreshScreen()  async{
    emit(LoadingNewsState());
     getData();
}
  List<String> listOfCategory = [
    'Healthy',
    'Technology',
    'Finance',
    'Arts',
    'History',
    'Travel',
    'Education',
    'Gaming',
    'Recipes'
  ];
  int selectIndex = 0;
  void clicKCategory(int index){
    selectIndex = index;
    emit(NewsChangeCategory());

  }



}