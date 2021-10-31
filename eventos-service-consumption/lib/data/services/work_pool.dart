import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:misiontic_template/domain/models/public_job.dart';
import 'package:misiontic_template/domain/services/misiontic_interface.dart';

class WorkPoolService implements MisionTicService {
  final String baseUrl = 'api.seatgeek.com';
  final String clientID = 'MjM5OTUyMTZ8MTYzNDY2NjQ2MC45MjM4MjQz';

  @override
  Future<List<PublicJob>> fecthData({int limit = 5, Map? map}) async {
    var queryParameters = {'client_id': clientID};
    var uri = Uri.https(baseUrl, '/2/events', queryParameters);
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
      final List<PublicJob> jobs = [];
      for (var job in res['jobs']) {
        jobs.add(PublicJob.fromJson(job));
      }
      return jobs;
    } else {
      throw Exception('Error on request');
    }
  }
}
