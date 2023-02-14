


import 'package:api_2/core/utils/constant/api_constant.dart';
import 'package:api_2/model.dart';
import 'package:dio/dio.dart';

class RemoteApi{
  Future<List<NewsModel>>getApiNews()async{
    final response =await Dio().get(ApiConstant.baseUrl1);
    if(response.statusCode ==200){
      final List jsonData = response.data['articles'];
      List<NewsModel> data1=jsonData.map((e) => NewsModel.fromJson(e)).toList();
     // List<NewsModel> data = List<NewsModel>.from((response.data['articles']as List).map((e) => NewsModel.fromJson(e)));
      return data1;
    }else{
      throw Exception('no data');
    }
  }
}