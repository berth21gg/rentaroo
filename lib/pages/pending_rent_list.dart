import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:rentaroo/database/databaseHelper.dart';
import 'package:rentaroo/models/furniture_model.dart';
import 'package:rentaroo/models/rent_model.dart';

class PendingRentListScreen extends StatefulWidget {
  const PendingRentListScreen({super.key});

  @override
  State<PendingRentListScreen> createState() => _PendingRentListScreenState();
}

class _PendingRentListScreenState extends State<PendingRentListScreen> {
  Future<List<Furniture>> _fetchFurniture() async {
    return DatabaseHelper().getAllFurniture();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Furniture>>(
        future: _fetchFurniture(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Furniture>? furnitureList =
                snapshot.data; // Lista de mobiliario

            // Verificar si hay muebles en la lista
            if (furnitureList != null && furnitureList.isNotEmpty) {
              // Si hay muebles mostrarlos en la lista
              return ListView.builder(
                itemCount: furnitureList.length,
                itemBuilder: (context, index) {
                  Furniture furniture = furnitureList[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(furniture.description),
                        subtitle: Text(
                            'Category: ${furniture.category}, Price: \$${furniture.price.toString()}'),
                      ),
                      Image.asset(
                          'assets/images/${removeDiacritics(furniture.category.toLowerCase().replaceAll(" ", "_"))}/${furniture.image}'),
                    ],
                  );
                },
              );
            } else {
              // Si no hay muebles
              return Center(
                child: Text('No hay muebles disponibles'),
              );
            }
          } else if (snapshot.hasError) {
            // Si ocurre un error al obtener los datos
            return Center(
              child: Text('Error al cargar los muebles'),
            );
          } else {
            // Si los datos aún están cargando
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
