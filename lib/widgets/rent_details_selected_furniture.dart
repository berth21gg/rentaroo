import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';
import 'package:rentaroo/database/databaseHelper.dart';
import 'package:rentaroo/models/furniture_model.dart';
import 'package:rentaroo/models/rent_detail_model.dart';
import 'package:rentaroo/widgets/rent_details_item.dart';

class FurnitureWithQuantity {
  final Furniture furniture;
  final int quantity;

  FurnitureWithQuantity({required this.furniture, required this.quantity});
}

class RentDetailsSelectedFurniture extends StatefulWidget {
  final int rentId;
  const RentDetailsSelectedFurniture({super.key, required this.rentId});

  @override
  State<RentDetailsSelectedFurniture> createState() =>
      _RentDetailsSelectedFurnitureState();
}

class _RentDetailsSelectedFurnitureState
    extends State<RentDetailsSelectedFurniture> {
  Future<List<FurnitureWithQuantity>> getFurnitureWithQuantityByRentId(
      int rentId) async {
    final List<Furniture> furnitureList =
        await DatabaseHelper().getFurnitureByRentId(rentId);
    final List<RentDetail> rentDetailsList =
        await DatabaseHelper().getRentDetailsByRentId(rentId);

    List<FurnitureWithQuantity> result = [];

    // Iterar sobre la lista de mobiliario y agregar la cantiad correspondiente
    for (var furniture in furnitureList) {
      // Busca el detalle de renta correspondiente a este mobiliario
      var rentDetail = rentDetailsList
          .firstWhere((detail) => detail.furnitureId == furniture.id);

      result.add(FurnitureWithQuantity(
          furniture: furniture, quantity: rentDetail.quantity));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: FutureBuilder<List<FurnitureWithQuantity>>(
          future: getFurnitureWithQuantityByRentId(widget.rentId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              List<FurnitureWithQuantity> data = snapshot.data!;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  FurnitureWithQuantity item = data[index];
                  return RentDetailsItems(
                      description: item.furniture.description,
                      price: item.furniture.price,
                      imageFurniture:
                          'assets/images/${removeDiacritics(item.furniture.category.toLowerCase().replaceAll(" ", "_"))}/${item.furniture.image}',
                      quantity: item.quantity);
                },
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    ));
  }
}
