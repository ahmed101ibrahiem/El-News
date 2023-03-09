import 'package:equatable/equatable.dart';

import '../../domain/intities/news.dart';

abstract class NewsState extends Equatable{

}
class LoadingNewsState extends NewsState{
  @override

  List<Object> get props => [];
}
class NewsInitState extends NewsState{
  List<Object> get props => [];

}
class SuccessNewsState extends NewsState{
  final List<News> listData;

  SuccessNewsState({required this.listData});
  List<Object> get props => [listData];

}
class ErrorNewsState extends NewsState{
  final String error;
  ErrorNewsState({required this.error});
  List<Object> get props => [error];

}

class NewsChangeCategory extends NewsState{
  List<Object> get props => [];
}