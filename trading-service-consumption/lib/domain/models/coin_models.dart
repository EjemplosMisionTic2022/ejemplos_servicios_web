class CoinModel {
  String name, symbol, iconUrl;
  int rank;
  double price, marketCap, volume;

  CoinModel(
      {required this.name,
      required this.iconUrl,
      required this.marketCap,
      required this.price,
      required this.rank,
      required this.symbol,
      required this.volume});

  factory CoinModel.fromJson(Map<String, dynamic> map) {
    return CoinModel(
        name: map['name'],
        iconUrl: map['icon'],
        marketCap: map['marketCap'],
        rank: map['rank'],
        price: map['price'],
        volume: map['volume'],
        symbol: map['symbol']
        );
  }
}