import 'package:flutter/material.dart';
import 'package:misiontic_template/data/services/coin_pool.dart';
import 'package:misiontic_template/domain/models/coin_model.dart';
import 'package:misiontic_template/domain/use_case/controllers/theme_controller.dart';

class ResponseScreen extends StatelessWidget {
  final ThemeController controller;

  const ResponseScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CoinPoolService service = CoinPoolService();
    Future<List<CoinModel>> futureCoins = service.fecthData();
    return FutureBuilder<List<CoinModel>>(
      future: futureCoins,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              CoinModel coin = items[index];
              return Card(
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("nombre: ${coin.name}"),
                        Text("simbolo: ${coin.symbol}"),
                        Text("precio: ${coin.price.toStringAsFixed(6)}"),
                        Text("Cambio 24h: ${coin.change24h.toStringAsFixed(2)}%"),
                        Text("Volumen 24h: ${coin.volume24h.toStringAsFixed(3)}")
                      ],
                    )

                  ],
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
