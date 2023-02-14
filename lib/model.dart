class NewsModel {
  final String author;
  final String title;
  final String description;
  final String urlToImage;

  NewsModel(
      {required this.author,
      required this.title,
      required this.description,
      required this.urlToImage});

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
      author: json['author']??'Ahmed',
      title: json['title']??'Ahmed',
      description: json['description']??'Ahmed',
      urlToImage: json['urlToImage']??'Ahmed');
}
