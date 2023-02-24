import 'package:api_2/features/data/datasource/remote_datasource.dart';
import 'package:api_2/features/domain/intities/news.dart';
import '../../../core/utils/share/internet_connection.dart';
import '../../domain/repository/news_repo.dart';
import '../datasource/locale_datasource.dart';

class NewsRepoImplement implements NewsRepo {
  final NewsRemoteData newsRemoteData;
  final NetworkInfo networkInfo;
  final NewsLocalDataSource newsLocalDataSource;

  NewsRepoImplement({
    required this.newsRemoteData,
    required this.newsLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<List<News>> getNewsData() async {
    if (await networkInfo.isConnected) {
      try {
        final myNews = await newsRemoteData.getNews();
        newsLocalDataSource.saveData(myNews);
        return myNews;
      } catch (e) {
        throw Exception(e);
      }
    } else {
      try {
        return await newsLocalDataSource.getSavedData();
      } catch (e) {
        throw Exception(e);
      }
    }
  }
}
