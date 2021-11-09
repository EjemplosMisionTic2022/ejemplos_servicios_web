import 'package:flutter/material.dart';
import 'package:misiontic_template/data/services/exchange_pool.dart';
import 'package:misiontic_template/domain/models/exchange_model.dart';
import 'package:misiontic_template/domain/use_case/controllers/theme_controller.dart';

class ResponseScreen extends StatelessWidget {
  final ThemeController controller;

  const ResponseScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExchangePoolService service = ExchangePoolService();
    Future<List<ExchangeModel>> futureCoins = service.fecthData();
    return FutureBuilder<List<ExchangeModel>>(
      future: futureCoins,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              ExchangeModel coin = items[index];
              return Card(
                child: Row(
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nombre: ${coin.name}"),
                          Text("Monedas: ${coin.currencies}"),
                          Text("Puntaje de Confianza: ${coin.confidenceScore.runtimeType == double?coin.confidenceScore.toStringAsFixed(3):coin.confidenceScore}"),
                          Text("Descripcion: ${coin.description ?? "No description"}"),
                          Text("Numero de mercados: ${coin.markets}"),
                        ],
                      ),
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
