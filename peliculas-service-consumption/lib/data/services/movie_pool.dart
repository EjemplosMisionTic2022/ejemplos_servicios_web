import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:misiontic_template/domain/models/movie_model.dart';
import 'package:misiontic_template/domain/services/misiontic_interface.dart';

class MoviePoolService implements MisionTicService {
  final String baseUrl = 'api.themoviedb.org';
  final String apiKey = '99d89823c35cd95e8a4a8481c8b02b28';

  @override
  Future<List<MovieModel>> fecthData({int limit = 5, Map? map}) async {
    var queryParameters = {'api_key': apiKey};
    var uri = Uri.https(baseUrl, '/3/trending/movie/day', queryParameters);
    final response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        // We add our service ApiKey to the request headers
        //'key': apiKey
      },
    );
    if (response.statusCode == 200) {
      var res = json.decode(response.body);
      final List<MovieModel> movies = [];
      for (var movie in res['results']) {
        movies.add(MovieModel.fromJson(movie));
      }
      return movies;
    } else {
      throw Exception('Error on request');
    }
  }
}