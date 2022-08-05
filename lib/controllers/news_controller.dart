import 'package:flutter_testing/models/article.dart';
import 'package:flutter_testing/repository/news_repository.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  static NewsController get to => Get.find();

  final NewsRepository newsRepository;

  NewsController(this.newsRepository);

  RxBool isLoading = false.obs;
  List<Article> articles = [];

  Future<void> getArticles() async {
    isLoading.value = true;
    articles = await newsRepository.getArticles();
    isLoading.value = false;
    update();
  }
}