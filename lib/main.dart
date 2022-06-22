import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green,
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];

  final String apiKey = 'cc2ff778b0e96962ba029a0f242e85e8';

  final readaccestoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjYzJmZjc3OGIwZTk2OTYyYmEwMjlhMGYyNDJlODVlOCIsInN1YiI6IjYyOGIyNzkyMWEzMjQ4MTUzOTk4ZWU1ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.L_fOT5bf2CEr1Cx4NFOTPT1pAVz0rxVvVp_IOgJDiTM';

  @override
  void initState() {
    loadmovie();
    super.initState();
  }

  loadmovie() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readaccestoken),
        logConfig: const ConfigLogger(showErrorLogs: true));

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['result'];
      tv = tvresult['result'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const modifiedText(
          text: 'Flutter Movie App',
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
