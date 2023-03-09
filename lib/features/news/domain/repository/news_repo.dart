


import '../intities/news.dart';

abstract class NewsRepo{
  Future<List<News>> getNewsData();
}