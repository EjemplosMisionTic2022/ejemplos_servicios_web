class CoinModel {
  String name, symbol;
  double price, change24h, volume24h;

  CoinModel(
      {required this.name,
      required this.change24h,
      required this.price,
      required this.symbol,
      required this.volume24h});

  factory CoinModel.fromJson(Map<String, dynamic> map) {
    return CoinModel(
        name: map['name'],
        change24h: map['change_24h'],
        price: map['price'],
        volume24h: map['volume_24h'],
        symbol: map['asset_id']
        );
  }
}