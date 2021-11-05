import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:misiontic_template/domain/models/artwork_model.dart';
import 'package:misiontic_template/domain/services/misiontic_interface.dart';

class ArtWorkPoolService implements MisionTicService {
  final String baseUrl = 'www.rijksmuseum.nl';
  final String apiKey = 'jtCHUvi7';

  @override
  Future<List<ArtWorkModel>> fecthData({int limit = 5, Map? map}) async {
    var queryParameters = {'ps': limit.toString(), 'key' : apiKey};
    var uri = Uri.https(baseUrl, '/api/nl/collection', queryParameters);
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
      final List<ArtWorkModel> artworks = [];
      for (var artwork in res['artObjects']) {
        artworks.add(ArtWorkModel.fromJson(artwork));
      }
      return artworks;
    } else {
      throw Exception('Error on request');
    }
  }
}