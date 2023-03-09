



import '../intities/news.dart';
import '../repository/news_repo.dart';

class GetNewsUseCase{
  final NewsRepo newsRepo;

  GetNewsUseCase({required this.newsRepo});
  Future<List<News>> call()async{
    return await newsRepo.getNewsData();
  }
}