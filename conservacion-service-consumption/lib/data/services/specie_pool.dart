import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:misiontic_template/domain/models/specie_model.dart';
import 'package:misiontic_template/domain/services/misiontic_interface.dart';

class SpeciePoolService implements MisionTicService {
  final String baseUrl = 'apiv3.iucnredlist.org';
  final String apiKey = '9bb4facb6d23f48efbf424bb05c0c1ef1cf6f468393bc745d42179ac4aca5fee';

  @override
  Future<List<SpecieModel>> fecthData({int limit = 5, Map? map}) async {
    var queryParameters = {'token': apiKey};
    var uri = Uri.https(baseUrl, '/api/v3/species/page/0', queryParameters);
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
      final List<SpecieModel> species = [];
      for (var specie in res['result'].take(limit)) {
        species.add(SpecieModel.fromJson(specie));
      }
      return species;
    } else {
      throw Exception('Error on request');
    }
  }
}