import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/controllers/news_controller.dart';
import 'package:flutter_testing/models/article.dart';
import 'package:flutter_testing/repository/news_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

void main() {
  late NewsController sut;
  late MockNewsRepository mockNewsRepository;

  setUp(() {
    mockNewsRepository = MockNewsRepository();
    sut = NewsController(mockNewsRepository);
  });

  test("Initial values are correct", () {
    expect(sut.articles, []);
    expect(sut.isLoading.value, false);
  });

  group("getArticles", () {
    final articles = [
      Article(title: "Test 1", content: "Test Content 1"),
      Article(title: "Test 2", content: "Test Content 2"),
      Article(title: "Test 3", content: "Test Content 3"),
    ];
    void arrangeNewsControllerReturns3Articles() {
      when(() => mockNewsRepository.getArticles()).thenAnswer((_) async => articles);
    }

    test("gets articles using the NewsController", () async {
      arrangeNewsControllerReturns3Articles();
      await sut.getArticles();
      verify(() => mockNewsRepository.getArticles()).called(1);
    });

    test(
      """Indicates loading of data,
      sets articles from controller,
      indicates the data is not being loaded anymore""", () async {
        arrangeNewsControllerReturns3Articles();
        final future = sut.getArticles();
        expect(sut.isLoading.value, true);
        await future;
        expect(sut.articles, articles);
        expect(sut.isLoading.value, false);
      });
  });
}