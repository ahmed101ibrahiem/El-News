

import 'package:api_2/features/domain/intities/news.dart';

abstract class NewsRepo{
  Future<List<News>> getNewsData();
}