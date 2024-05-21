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
  final String state = 'Por cumplir';

  @override
  void initState() {
    super.initState();
    _fetchAndUpdateRentList();
  }

  Future<void> _fetchAndUpdateRentList() async {
    // Actualizar la lista de rentas utilizando provider
    List<Rent> updatedList = await DatabaseHelper().getRentsByState(state);
    Provider.of<RentListProvider>(context, listen: false)
        .updateRentPendingList(updatedList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RentListProvider>(
        builder: (context, provider, _) {
          List<Rent> rentList = provider.rentPendingList;
          if (rentList.isNotEmpty) {
            return ListView.builder(
              itemCount: rentList.length,
              itemBuilder: (context, index) {
                Rent rent = rentList[index];
                return Hero(
                  tag: rent.id!,
                  child: PendingRentCard(
                    title: rent.title,
                    startDate: rent.startDate,
                    dueDate: rent.dueDate,
                    state: rent.state,
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return RentDetailsPage(rentId: rent.id);
                          },
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                                opacity: animation, child: child);
                          },
                          transitionDuration: const Duration(milliseconds: 800),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('No hay rentas disponibles'),
            );
          }
        },
      ),
    );
  }
}
