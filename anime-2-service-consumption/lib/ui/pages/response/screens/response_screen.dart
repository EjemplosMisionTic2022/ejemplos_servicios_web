import 'package:flutter/material.dart';
import 'package:misiontic_template/data/services/anime_pool.dart';
import 'package:misiontic_template/domain/models/anime_model.dart';
import 'package:misiontic_template/domain/use_case/controllers/theme_controller.dart';

class ResponseScreen extends StatelessWidget {
  final ThemeController controller;

  const ResponseScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnimePoolService service = AnimePoolService();
    Future<List<AnimeModel>> futureJobs = service.fecthData();
    return FutureBuilder<List<AnimeModel>>(
      future: futureJobs,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              AnimeModel anime = items[index];
              return Card(
                child: Row(
                  children: [
                    Image.network(anime.posterUrl,
                      width: 120,),
                    const SizedBox(width: 5,),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Titulo: ${anime.title}"),
                          Text("Rank: ${anime.rank}"),
                          Text("Fecha de inicio: ${anime.startDate ?? "unknown"}"),
                          Text("Numero de miembros: ${anime.members}"),
                          Text("Tipo: ${anime.showType}")
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
