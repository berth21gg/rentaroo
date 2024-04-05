import 'package:flutter/material.dart';
import 'package:rentaroo/database/databaseHelper.dart';
import 'package:rentaroo/models/rent_model.dart';

class PendingRentCalendarScreen extends StatefulWidget {
  const PendingRentCalendarScreen({super.key});

  @override
  State<PendingRentCalendarScreen> createState() =>
      _PendingRentCalendarScreenState();
}

class _PendingRentCalendarScreenState extends State<PendingRentCalendarScreen> {
  Future<List<Rent>> _fetchRent() async {
    return DatabaseHelper().getAllRents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Rent>>(
        future: _fetchRent(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Rent>? rentList = snapshot.data; // Lista de mobiliario

            // Verificar si hay muebles en la lista
            if (rentList != null && rentList.isNotEmpty) {
              // Si hay muebles mostrarlos en la lista
              return ListView.builder(
                itemCount: rentList.length,
                itemBuilder: (context, index) {
                  Rent rent = rentList[index];
                  return ListTile(
                    title: Text(rent.state),
                    subtitle:
                        Text('Id: ${rent.id}, Start date: ${rent.startDate}'),
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
              child: Text('Error al cargar los muebles: ${snapshot.error}'),
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
