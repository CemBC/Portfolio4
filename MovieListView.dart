import 'package:flutter/material.dart';

import 'package:portfolio4/Portfolio4/Moive.dart';

class MovieListView extends StatelessWidget{
  final List<Movie> movies;

  const MovieListView({required this.movies});

  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context , index) {
          return Placeholder();
        }
    );
  }
}