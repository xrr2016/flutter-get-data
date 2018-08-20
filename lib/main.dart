import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter get datas",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: AppHomePage(),
    );
  }
}

class Animate {
  final int rank;
  final String imgUrl;
  final String title;
  final double score;
  final String url;
  final String airingStart;
  final String airingEnd;

  Animate({
    this.rank,
    this.imgUrl,
    this.title,
    this.score,
    this.url,
    this.airingStart,
    this.airingEnd,
  });

  factory Animate.fromJson(Map<String, dynamic> json) {
    return Animate(
      rank: json['rank'] as int,
      imgUrl: json['image_url'] as String,
      title: json['title'] as String,
      score: json['score'] as double,
      url: json['url'] as String,
      airingStart: json['airing_start'] as String,
      airingEnd: json['airing_end'] as String,
    );
  }
}

class AnimateCard extends StatelessWidget {
  Animate animate;

  AnimateCard(this.animate);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          print(animate.url);
        },
        child: ListTile(
          contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: Text(
                    animate.rank < 10 ? '0${animate.rank.toString()}' : animate.rank.toString()),
              ),
              Image(image: NetworkImage(animate.imgUrl), width: 45.0, height: 45.0),
            ],
          ),
          title: Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text(
              animate.title,
              maxLines: 2,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.deepPurple, fontSize: 16.0),
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Text(
                  "上映日期:",
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Text(
                  animate.airingStart,
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Text(
                  "下映日期:",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
              Text(
                animate.airingEnd,
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          ),
          trailing: Text(
            animate.score.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}

class AppHomePage extends StatefulWidget {
  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  List movies;

  Future getMovies({String type = 'anime', int page = 1, String subtype = 'movie'}) async {
    final String url = "https://api.jikan.moe/top/$type/$page/$subtype";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List top = json.decode(response.body)['top'];
      setState(() {
        movies = top.map((json) => Animate.fromJson(json)).toList();
      });
    } else {
      print("err code $response.statusCode");
    }
  }

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Animate Movies'),
      ),
      body: movies == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (BuildContext context, int index) {
                  return AnimateCard(movies[index]);
                },
              ),
            ),
    );
  }
}
