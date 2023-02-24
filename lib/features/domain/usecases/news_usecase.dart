


import 'package:api_2/features/domain/intities/news.dart';
import 'package:api_2/features/domain/repository/news_repo.dart';

class GetNewsUseCase{
  final NewsRepo newsRepo;

  GetNewsUseCase({required this.newsRepo});
  Future<List<News>> call()async{
    return await newsRepo.getNewsData();
  }
}