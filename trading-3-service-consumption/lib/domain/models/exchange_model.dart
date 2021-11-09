class ExchangeModel {
  String name;
  String? description;
  int currencies, markets;
  dynamic confidenceScore;

  ExchangeModel(
      {required this.name,
      required this.confidenceScore,
      required this.currencies,
      required this.description,
      required this.markets});

  factory ExchangeModel.fromJson(Map<String, dynamic> map) {
    return ExchangeModel(
        name: map['name'],
        description: map['description'],
        confidenceScore: map['confidence_score'],
        currencies: map['currencies'],
        markets: map['markets']);
  }
}