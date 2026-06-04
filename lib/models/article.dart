import 'package:practice_flutter/models/user.dart';
class Article {

  Article({
    required this.title,
    required this.user,
    required this.createdAt,
    required this.url,
    //likesCountとtagsは存在しない場合があるのでデフォルト値を設定
    //requiredは使えない
    this.likesCount = 0,
    this.tags = const[],
  });

  final String title;
  final User user;
  final int likesCount;
  final List<String> tags;
  final DateTime createdAt;
  final String url;

  factory Article.fromJson(dynamic json){
    return Article(title: json['title'] as String,
      user: User.fromJson(json['user']),
      createdAt: DateTime.parse(json['created_at'] as String),
      url: json['url'] as String,
      likesCount: json['likes_count'] as int,
      tags: List<String>.from(json['tags'].map((tag) => tag['name'])),

    );
  }
}