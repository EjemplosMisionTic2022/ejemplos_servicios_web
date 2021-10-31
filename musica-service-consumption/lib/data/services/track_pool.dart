//ZTcyNjc0YWUtYmE1NS00YjA4LThmZGEtMWRiN2Y5MTE0NTc2

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:misiontic_template/domain/models/track_model.dart';
import 'package:misiontic_template/domain/services/misiontic_interface.dart';

class TrackPoolService implements MisionTicService {
  final String baseUrl = 'api.napster.com';
  final String apiKey = 'ZTcyNjc0YWUtYmE1NS00YjA4LThmZGEtMWRiN2Y5MTE0NTc2';

  @override
  Future<List<TrackModel>> fecthData({int limit = 10, Map? map}) async {
    var queryParameters = {'limit': limit.toString(), 'apikey' : apiKey};
    var uri = Uri.https(baseUrl, '/v2.2/tracks/top', queryParameters);
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
      final List<TrackModel> tracks = [];
      for (var track in res['tracks']) {
        tracks.add(TrackModel.fromJson(track));
      }
      return tracks;
    } else {
      throw Exception('Error on request');
    }
  }
}