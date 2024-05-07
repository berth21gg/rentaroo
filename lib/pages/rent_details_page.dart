import 'package:flutter/material.dart';
import 'package:rentaroo/database/databaseHelper.dart';
import 'package:rentaroo/models/furniture_model.dart';
import 'package:rentaroo/models/rent_model.dart';
import 'package:rentaroo/widgets/pending_rent_card.dart';
import 'package:rentaroo/widgets/rent_details_selected_furniture.dart';

class RentDetailsPage extends StatefulWidget {
  final int? rentId;
  const RentDetailsPage({super.key, required this.rentId});

  @override
  State<RentDetailsPage> createState() => _RentDetailsPageState();
}

class _RentDetailsPageState extends State<RentDetailsPage> {
  Future<void> _fetchFurnitureList() async {
    List<Furniture> furnitureList =
        await DatabaseHelper().getFurnitureByRentId(widget.rentId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de renta'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Card con detalles de la renta
          FutureBuilder<Rent>(
            future: DatabaseHelper().getRentByRentId(widget.rentId!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                Rent rent = snapshot.data!;
                return PendingRentCard(
                  title: rent.title,
                  startDate: rent.startDate,
                  dueDate: rent.dueDate,
                  state: rent.state,
                  onTap: () {},
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          // Card con lista de mobiliario
          RentDetailsSelectedFurniture(rentId: widget.rentId!),
          _buttonToSetState(),
        ],
      ),
    );
  }

  _buttonToSetState() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {},
              child: const Text('Cancelar'),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {},
              child: const Text('Completar'),
            ),
          ),
        ],
      ),
    );
  }
}
