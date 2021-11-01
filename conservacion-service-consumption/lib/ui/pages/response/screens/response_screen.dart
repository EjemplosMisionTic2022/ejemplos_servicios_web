import 'package:flutter/material.dart';
import 'package:misiontic_template/data/services/specie_pool.dart';
import 'package:misiontic_template/domain/models/specie_model.dart';
import 'package:misiontic_template/domain/use_case/controllers/theme_controller.dart';

class ResponseScreen extends StatelessWidget {
  final ThemeController controller;

  const ResponseScreen({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SpeciePoolService service = SpeciePoolService();
    Future<List<SpecieModel>> futureSpecies = service.fecthData();
    return FutureBuilder<List<SpecieModel>>(
      future: futureSpecies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              SpecieModel specie = items[index];
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Reino Animal: ${specie.kingdomName}"),
                    Text("Nombre de la familia: ${specie.familyName}"),
                    Text("Nombre de clase: ${specie.className}"),
                    Text("Nombre del orden: ${specie.orderName}"),
                    Text("Nombre cientifico: ${specie.scientificName}"),
                    Text("Autoridad de la taxonomia: ${specie.taxonomicAuthority}"),
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
