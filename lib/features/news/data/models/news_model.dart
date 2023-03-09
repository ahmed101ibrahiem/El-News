


import '../../domain/intities/news.dart';

class NewsModel extends News{

  NewsModel({required super.author, required super.content,required super.date, required super.url, required super.source, required super.title, required super.description, required super.urlToImage});

  Map<String,dynamic> toJson(){
    return {
      'title' :title,
      'author': author,
      'content':content,
      'description':description,
      'urlToImage':urlToImage,
      'url':url,
      'date':date,
      'source':source
    };
  }
  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
      author: json['author']??'No Author',
      date: json['publishedAt']??'',
      content: json['content']??'No data Content',
      source: json['source']??{},
      url: json['url']??'',
      title: json['title']??'No title',
      description: json['description']??'',
      urlToImage: json['urlToImage']??'https://i.stack.imgur.com/81VAF.jpg');


}

class Source {
  final num id;
  final String publisherName;

  Source({required this.id,required this.publisherName});

  factory Source.fromJson(Map<String,dynamic>json)=>Source(
    id: json['id']??0,
    publisherName: json['name']??'no name'
  );
}