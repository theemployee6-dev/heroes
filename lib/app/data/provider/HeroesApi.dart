import 'package:dio/dio.dart';
import 'dart:async';

//import 'package:http/http.dart' as http;

import 'package:heroes/app/data/models/heroesModel.dart';

class HeroesApi {
  final _dio = Dio();

  Future<List<HeroesModel>> newRequestHeroes() async {
    try {
      final response = await _dio.get(
          'https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/all.json');
      return (response.data as List)
          .map((e) => HeroesModel.fromMap(e))
          .toList();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
