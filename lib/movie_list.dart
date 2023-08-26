import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'movie_detail_screen.dart';

class MovieList extends StatefulWidget {
  final String token;

  MovieList({required this.token});

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List<dynamic> _movies = [];

  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  Future<void> _fetchMovies() async {
    final apiKey = '78c3880f42f17ceb75e74371f28ec8ec';
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final List<dynamic> movies = jsonResponse['results'];
      setState(() {
        _movies = movies;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _movies.length,
      itemBuilder: (context, index) {
        final movie = _movies[index];
        return ListTile(
          title: Text(movie['title']),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    MovieDetailScreen(movie: movie, token: widget.token),
              ),
            );
          },
        );
      },
    );
  }
}
