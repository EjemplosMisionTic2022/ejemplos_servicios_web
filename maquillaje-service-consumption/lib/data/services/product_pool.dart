import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:misiontic_template/domain/models/product_model.dart';
import 'package:misiontic_template/domain/services/misiontic_interface.dart';

class ProductPoolService implements MisionTicService {
  final String baseUrl = 'makeup-api.herokuapp.com';
  //final String apiKey = 'wNLombyTzPIjLjkfp/aohu5b0Xy.iOM.4Sj4Q3.s9Ri9riyE6y5E2';

  @override
  Future<List<ProductModel>> fecthData({int limit = 5, Map? map}) async {
    //var queryParameters = {'limit': limit.toString()};
    var uri = Uri.http(baseUrl, '/api/v1/products.json');
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
      final List<ProductModel> products = [];
      for (var product in res.take(limit)) {
        products.add(ProductModel.fromJson(product));
      }
      return products;
    } else {
      throw Exception('Error on request');
    }
  }
}