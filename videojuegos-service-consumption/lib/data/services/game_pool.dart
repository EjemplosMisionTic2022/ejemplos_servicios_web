import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:misiontic_template/domain/models/game_model.dart';
import 'package:misiontic_template/domain/services/misiontic_interface.dart';

class GamePoolService implements MisionTicService {
  final String baseUrl = 'www.freetogame.com';
  //final String apiKey = 'wNLombyTzPIjLjkfp/aohu5b0Xy.iOM.4Sj4Q3.s9Ri9riyE6y5E2';

  @override
  Future<List<GameModel>> fecthData({int limit = 10, Map? map}) async {
    //var queryParameters = {'limit': limit.toString()};
    var uri = Uri.https(baseUrl, '/api/games');
    final response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        // We add our service ApiKey to the request headers
        //'key': apiKey
      },
    );
    if (response.statusCode == 200) {
      List<dynamic> res = json.decode(response.body);
      final List<GameModel> games = [];
      for (var game in res.take(limit)) {
        games.add(GameModel.fromJson(game));
      }
      return games;
    } else {
      throw Exception('Error on request');
    }
  }
}