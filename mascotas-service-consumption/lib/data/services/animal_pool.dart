import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:misiontic_template/domain/models/animal_model.dart';
import 'package:misiontic_template/domain/services/misiontic_interface.dart';

class AnimalPoolService implements MisionTicService {
  final String baseUrl = 'api.rescuegroups.org';
  final String apiKey = '8b0JZFvn';

  @override
  Future<List<AnimalModel>> fecthData({int limit = 5, Map? map}) async {
    var queryParameters = {'limit': limit.toString()};
    var uri = Uri.https(baseUrl, '/v5/public/animals', queryParameters);
    final response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        // We add our service ApiKey to the request headers
        'Authorization': apiKey
      },
    );
    if (response.statusCode == 200) {
      var res = json.decode(response.body);
      final List<AnimalModel> animals = [];
      for (var animal in res['data']) {
        animals.add(AnimalModel.fromJson(animal));
      }
      return animals;
    } else {
      throw Exception('Error on request');
    }
  }
}