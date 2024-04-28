import 'dart:convert';

import 'package:portfolio4/Portfolio4/Moive.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatelessWidget{
 MainScreen ({super.key});

 Widget build(BuildContext context) {
  return Scaffold(
    body: HttpWidget(),
  );
 }
}


class HttpWidget extends StatefulWidget{
  final String URL = 'https://670ef2d6-dbdd-454c-b4d7-6960afb18cc2.mock.pstmn.io/movies';

  HttpWidget({super.key});

  State<HttpWidget> createState() => _HttpWidgetState();
}

class _HttpWidgetState extends State<HttpWidget> {
  List<Movie> movies =[];

  void initState(){
    super.initState();
    _loadData().then((value) => setState(() {
      movies =value;
    }));
  }

  Future<List<Movie>> _loadData() async {
    final response = await http.get(Uri.parse(widget.URL));
    var returnedValue = <Movie>[];

    if(response.statusCode == 200) {
      final movies = jsonDecode(response.body) as List;
      returnedValue = List.generate(movies.length,
              (index) => Movie.fromJson(movies[index] as Map<String, dynamic>));
    }
    return returnedValue;

  }
}