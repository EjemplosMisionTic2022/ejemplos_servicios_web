import 'package:flutter/material.dart';
import 'package:misiontic_template/data/services/track_pool.dart';
import 'package:misiontic_template/domain/models/track_model.dart';
import 'package:misiontic_template/domain/use_case/controllers/theme_controller.dart';

class ResponseScreen extends StatelessWidget {
  final ThemeController controller;

  const ResponseScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TrackPoolService service = TrackPoolService();
    Future<List<TrackModel>> futureJobs = service.fecthData();
    return FutureBuilder<List<TrackModel>>(
      future: futureJobs,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              TrackModel track = items[index];
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nombre: ${track.name}"),
                    Text("Album: ${track.albumName}"),
                    Text("Artista: ${track.artistName}"),
                    Text("Duracion: ${track.playbackSeconds} Segundos")
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
