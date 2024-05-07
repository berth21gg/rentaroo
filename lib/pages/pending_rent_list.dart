import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentaroo/database/databaseHelper.dart';
import 'package:rentaroo/models/rent_model.dart';
import 'package:rentaroo/pages/rent_details_page.dart';
import 'package:rentaroo/providers/rent_list_provider.dart';
import 'package:rentaroo/widgets/pending_rent_card.dart';

class PendingRentListScreen extends StatefulWidget {
  const PendingRentListScreen({super.key});

  @override
  State<PendingRentListScreen> createState() => _PendingRentListScreenState();
}

class _PendingRentListScreenState extends State<PendingRentListScreen> {
  @override
  void initState() {
    super.initState();
    _fetchAndUpdateRentList();
  }

  Future<void> _fetchAndUpdateRentList() async {
    // Actualizar la lista de rentas utilizando provider
    List<Rent> updatedList = await DatabaseHelper().getAllRents();
    Provider.of<RentListProvider>(context, listen: false)
        .updateRentList(updatedList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RentListProvider>(
        builder: (context, provider, _) {
          List<Rent> rentList = provider.rentList;
          if (rentList.isNotEmpty) {
            return ListView.builder(
              itemCount: rentList.length,
              itemBuilder: (context, index) {
                Rent rent = rentList[index];
                int? idRent = rent.id;
                return PendingRentCard(
                  title: rent.title,
                  startDate: rent.startDate,
                  dueDate: rent.dueDate,
                  state: rent.state,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RentDetailsPage(rentId: rent.id),
                        ));
                  },
                );
              },
            );
          } else {
            return Center(
              child: Text('No hay rentas disponibles'),
            );
          }
        },
      ),
    );
  }
}
