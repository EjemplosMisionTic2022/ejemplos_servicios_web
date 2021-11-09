import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:misiontic_template/domain/models/exchange_model.dart';
import 'package:misiontic_template/domain/services/misiontic_interface.dart';

class ExchangePoolService implements MisionTicService {
  final String baseUrl = 'api.coinpaprika.com';
  //final String apiKey = 'wNLombyTzPIjLjkfp/aohu5b0Xy.iOM.4Sj4Q3.s9Ri9riyE6y5E2';

  @override
  Future<List<ExchangeModel>> fecthData({int limit = 5, Map? map}) async {
    //var queryParameters = {'limit': limit.toString()};
    var uri = Uri.https(baseUrl, '/v1/exchanges');
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
      final List<ExchangeModel> coins = [];
      for (var coin in res.take(limit)) {
        coins.add(ExchangeModel.fromJson(coin));
      }
      return coins;
    } else {
      throw Exception('Error on request');
    }
  }
}