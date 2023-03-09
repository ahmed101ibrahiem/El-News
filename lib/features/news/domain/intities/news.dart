import 'package:equatable/equatable.dart';

class News extends Equatable{
  final String author;
  final String title;
  final String description;
  final String urlToImage;
  final String url;
  final String content;
  final String date;

  final Map<String,dynamic> source;




  News(
      {required this.author,
        required this.date,
        required this.content,
     required   this.url,required this.source,
      required this.title,
      required this.description,
      required this.urlToImage});

  @override
  // TODO: implement props
  List<Object?> get props => [author,title,date,description,url,urlToImage,source];
}
