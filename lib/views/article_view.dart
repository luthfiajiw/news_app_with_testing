
import 'package:flutter/material.dart';
import 'package:flutter_testing/models/article.dart';

class ArticleView extends StatelessWidget {
  final Article article;

  const ArticleView({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: mq.padding.top,
          bottom: mq.padding.bottom,
          left: 8,
          right: 8,
        ),
        child: Column(
          children: [
            Text(
              article.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 8),
            Text(article.content),
          ],
        ),
      ),
    );
  }
}