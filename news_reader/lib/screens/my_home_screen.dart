import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_reader/models/news_model.dart';
import 'package:news_reader/services/news_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  void saveNewResponse(NewsResponse newsResponse) {
    final myBox = Hive.box<NewsResponse>('newsReader');
    myBox.put('latestNews', newsResponse);
  }

  NewsResponse? loadNewsResponse() {
    final myBox = Hive.box<NewsResponse>('newsReader');
    return myBox.get('latestNews');
  }

  NewsResponse? _newsResponse;
  NewsService newsService = NewsService('0712d951502b4ef2bdfcde57da72c8f8');

  _fetchNewsResponse() async {
    try {
      setState(() {
        _newsResponse = null;
      });

      final newsResponse = await newsService.getNewsResponse();
      setState(() {
        _newsResponse = newsResponse;
      });
      saveNewResponse(newsResponse);
    } catch (e) {
      print('condnt load new data');
      print(e);

      final cachedNews = loadNewsResponse();
      if (cachedNews != null) {
        setState(() {
          _newsResponse = cachedNews;
        });
      }
    }
  }

  formatDate(String dateString) {
    try {
      final dateTime = DateTime.parse(dateString);
      final formatter = DateFormat('MMMM d, y');

      return formatter.format(dateTime);
    } catch (e) {
      print('Invalid date');
    }
  }

  String PLACEHOLDER_IMAGE_LINK =
      'https://cdn.pixabay.com/photo/2022/05/03/09/39/loading-7171342_1280.png';
  Color primaryGreenColor = Color.fromARGB(255, 34, 171, 3);
  Color backgroundColor = Color.fromARGB(255, 241, 241, 237);

  @override
  void initState() {
    super.initState();
    _fetchNewsResponse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/newschainlogo.png', height: 35, width: 35),
            Text('newschain', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
        surfaceTintColor: Colors.transparent,
        actionsPadding: EdgeInsets.all(10),
        actions: [Icon(Icons.login)],
      ),
      drawer: Drawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'Breaking News',
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: _newsResponse?.articles.length,
              itemBuilder: (context, index) {
                var article = _newsResponse?.articles[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              article?.urlToImage ?? PLACEHOLDER_IMAGE_LINK,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          'News',
                          style: Theme.of(context).textTheme.labelLarge!
                              .copyWith(
                                color: primaryGreenColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          article?.title ?? '',
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${article?.author ?? ''} , ${formatDate(article?.date ?? '')}",
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                            Icon(
                              Icons.share,
                              size: 20,
                              color: Colors.grey[700],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
