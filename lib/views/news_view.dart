
import 'package:flutter/material.dart';
import 'package:flutter_testing/controllers/news_controller.dart';
import 'package:flutter_testing/models/article.dart';
import 'package:flutter_testing/repository/news_repository.dart';
import 'package:flutter_testing/views/article_view.dart';
import 'package:get/get.dart';

class NewsView extends StatelessWidget {
  final controller = Get.put(NewsController(NewsRepository()));

  NewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
      init: NewsController(NewsRepository()),
      initState: (state) {
        controller.getArticles();
      },
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('News'),
          ),
          body: _.isLoading.value
          ? const Center(
            child: CircularProgressIndicator(),
          )
          : Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 16,
            ),
            child: ListView.builder(
              itemCount: _.articles.length,
              itemBuilder: (context, index) {
                Article article = _.articles[index];

                return Card(
                  elevation: 2,
                  child: InkWell(
                    onTap: () => Get.to(ArticleView(article: article)),
                    child: ListTile(
                      title: Text(article.title),
                      subtitle: Text(
                        article.content,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      }
    );
  }
}