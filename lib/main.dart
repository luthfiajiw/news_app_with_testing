import 'package:flutter/material.dart';
import 'package:flutter_testing/views/news_view.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News Apps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewsView(),
    );
  }
}
