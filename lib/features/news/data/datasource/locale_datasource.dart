import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/news_model.dart';

abstract class NewsLocalDataSource {
  Future<List<NewsModel>> getSavedData();

  Future<void> saveData(List<NewsModel> model);
}

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  final SharedPreferences sharedPreferences;

  NewsLocalDataSourceImpl({required this.sharedPreferences});


  @override
  Future<void> saveData(List<NewsModel> model) {
    List modelToJson = model.map((e) => e.toJson()).toList();
    sharedPreferences.setString('local data', json.encode(modelToJson));
    return Future.value();
  }



  @override
  Future<List<NewsModel>> getSavedData() {
    final data = sharedPreferences.getString('local data');

    if (data != null) {
      List decodeData = json.decode(data);
      List<NewsModel> myNewsData =
      decodeData.map((e) => NewsModel.fromJson(e)).toList();
      return Future.value(myNewsData);
    } else {
      throw Exception('no local data');
    }
  }
}
