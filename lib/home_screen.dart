import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'movie_list.dart';

class HomeScreen extends StatelessWidget {
  final String token;

  HomeScreen({required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas populares'),
        backgroundColor: Colors.red,
      ),
      body: MovieList(token: token),
    );
  }
}
