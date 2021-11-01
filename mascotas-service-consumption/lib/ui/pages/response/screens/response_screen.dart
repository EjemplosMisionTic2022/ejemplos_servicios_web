import 'package:flutter/material.dart';
import 'package:misiontic_template/data/services/animal_pool.dart';
import 'package:misiontic_template/domain/models/animal_model.dart';
import 'package:misiontic_template/domain/use_case/controllers/theme_controller.dart';

class ResponseScreen extends StatelessWidget {
  final ThemeController controller;

  const ResponseScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnimalPoolService service = AnimalPoolService();
    Future<List<AnimalModel>> futureJobs = service.fecthData();
    return FutureBuilder<List<AnimalModel>>(
      future: futureJobs,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              AnimalModel animal = items[index];
              return Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nombre: ${animal.name}"),
                          Text("Raza: ${animal.breed}"),
                          Text("Descripcion: ${animal.description}"),
                          Text("Sexo: ${animal.sex}"),
                        ],
                      ) 
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
