import 'dart:convert' as json;
import 'package:flutter/cupertino.dart';

import 'package:fluttertradexa/datamodel/moviemodel.dart';
import 'package:http/http.dart' as http;


class NetworkManager {
  Future<List<MovieModel>> getMovieSearchResult(
      String movieQuery, BuildContext context) async {
    List<MovieModel> moviedata = [];
    http.Response response = await http.get(
        'https://api.themoviedb.org/3/search/movie?api_key=ec1410c352ab7eb39e3f502a39d852ef&language=en-US&query=$movieQuery&page=1&include_adult=false');
    if (response.statusCode == 200) {
      var jsonData = json.jsonDecode(response.body);
      var movieresult = jsonData['results'];
      movieresult.forEach((element) {
        moviedata.add(MovieModel.getData(element));
      });
      print(moviedata.length);
      return moviedata;
    } else {
      return null;
    }
  }
}
