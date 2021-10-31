import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:misiontic_template/data/services/event_pool.dart';
import 'package:misiontic_template/domain/models/event_model.dart';
import 'package:misiontic_template/domain/use_case/controllers/theme_controller.dart';

class ResponseScreen extends StatelessWidget {
  final ThemeController controller;

  const ResponseScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EventPoolService service = EventPoolService();
    Future<List<EventModel>> futureEvents = service.fecthData();
    return FutureBuilder<List<EventModel>>(
      future: futureEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              EventModel event = items[index];
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Titulo: ${event.title}"),
                    Text("Tipo de evento: ${event.type}"),
                    Text("Pais: ${event.country}"),
                    Text("Ciudad: ${event.city}"),
                    Text("Direccion: ${event.address}"),
                    Text("Fecha y hora: ${event.datetimeEvent.toString()}"),
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
