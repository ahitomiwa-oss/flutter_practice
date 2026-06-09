import 'package:flutter/material.dart';
import 'package:practice_flutter/models/article.dart';
import 'package:intl/intl.dart';
import 'package:practice_flutter/screens/article_screen.dart';

class ArticleContainer extends StatelessWidget {
  const ArticleContainer({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal:16,
        vertical: 12,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => ArticleScreen(article: article)),
            ),            
          );
        },
        child:Container(
          padding:const EdgeInsets.symmetric(

          horizontal:20,
          vertical: 16,
        ),
        decoration: const BoxDecoration(
          color: Color(0xFF55C500), //背景色
          borderRadius: BorderRadius.all(
            Radius.circular(32), //角丸
        ),
       ),
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat('yyyy/MM/dd').format(article.createdAt), //createdAt 
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
            ),
          ),
          //title
          Text(
            article.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(//tags
            '#${article.tags.join(' #')}',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Icon(
                    Icons.favorite, //いいねアイコン
                    color: Colors.white,
                  ),
                  Text(
                    article.likesCount.toString(),
                    style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children:[
                  CircleAvatar(
                    backgroundImage: NetworkImage(article.user.profileImageUrl), //ユーザープロフィール画像
                  ),
                  const SizedBox(height: 4),
                  Text(
                    article.user.id,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                        ),
                     ),
                   ],
                 ),
               ],
             ),
           ],
          ),
        ),
      ),
    );
  }
}