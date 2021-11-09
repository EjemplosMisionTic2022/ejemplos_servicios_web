import 'package:flutter/material.dart';
import 'package:misiontic_template/data/services/event_pool.dart';
import 'package:misiontic_template/domain/models/event_model.dart';
import 'package:misiontic_template/domain/use_case/controllers/theme_controller.dart';

class ResponseScreen extends StatelessWidget {
  final ThemeController controller;

  const ResponseScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EventPoolService service = EventPoolService();
    Future<List<EventModel>> futureCoins = service.fecthData();
    return FutureBuilder<List<EventModel>>(
      future: futureCoins,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              EventModel coin = items[index];
              return Card(
                child: Row(
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.network(coin.screenshot,
                              width: 300,),
                          ),
                          Text("Titulo: ${coin.title}"),
                          Text("Descripcion: ${coin.description}"),
                          Text("Tipo de evento: ${coin.type}"),
                          Text("Organizador: ${coin.organizer}"),
                          Text("Fecha de inicio: ${coin.startDate.toString()}"),
                          Text("Lugar/Ubicacion: ${coin.venue}")
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
