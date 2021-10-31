import 'package:flutter/material.dart';
import 'package:misiontic_template/data/services/movie_pool.dart';
import 'package:misiontic_template/domain/models/movie_model.dart';
import 'package:misiontic_template/domain/use_case/controllers/theme_controller.dart';

class ResponseScreen extends StatelessWidget {
  final ThemeController controller;

  const ResponseScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoviePoolService service = MoviePoolService();
    Future<List<MovieModel>> futureJobs = service.fecthData();
    return FutureBuilder<List<MovieModel>>(
      future: futureJobs,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              MovieModel movie = items[index];
              return Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(movie.posterUrl,
                      width: 120,
                    ),
                    const SizedBox(width: 5,),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Titulo: ${movie.title}"),
                          Text("Tipo de medio: ${movie.mediaType}"),
                          Text("Overview: ${movie.overview}"),
                          Text("Fecha de lanzamiento: ${movie.releaseDate.toString()}")
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
