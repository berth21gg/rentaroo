import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentaroo/database/databaseHelper.dart';
import 'package:rentaroo/models/rent_model.dart';
import 'package:rentaroo/providers/rent_list_provider.dart';
import 'package:rentaroo/providers/rent_provider.dart';
import 'package:rentaroo/widgets/pending_rent_card.dart';
import 'package:rentaroo/widgets/rent_details_selected_furniture.dart';

class RentDetailsPage extends StatefulWidget {
  final int? rentId;
  const RentDetailsPage({super.key, required this.rentId});

  @override
  State<RentDetailsPage> createState() => _RentDetailsPageState();
}

class _RentDetailsPageState extends State<RentDetailsPage> {
  @override
  void initState() {
    super.initState();
    _fetchAndUpdateRent();
  }

  Future<void> _fetchAndUpdateRent() async {
    Rent rent = await DatabaseHelper().getRentByRentId(widget.rentId!);
    Provider.of<RentProvider>(context, listen: false).updateRent(rent);
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

          Consumer<RentProvider>(
            builder: (context, provider, _) {
              Rent rent = provider.rent;
              return Hero(
                tag: widget.rentId!,
                child: PendingRentCard(
                  title: rent.title,
                  startDate: rent.startDate,
                  dueDate: rent.dueDate,
                  state: rent.state,
                  onTap: () {},
                ),
              );
            },
          ),

          // FutureBuilder<Rent>(
          //   future: DatabaseHelper().getRentByRentId(widget.rentId!),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.done) {
          //       if (snapshot.hasError) {
          //         return Text('Error: ${snapshot.error}');
          //       }
          //       Rent rent = snapshot.data!;
          //       return Hero(
          //         tag: rent.id!,
          //         child: PendingRentCard(
          //           title: rent.title,
          //           startDate: rent.startDate,
          //           dueDate: rent.dueDate,
          //           state: rent.state,
          //           onTap: () {},
          //         ),
          //       );
          //     } else {
          //       return const CircularProgressIndicator();
          //     }
          //   },
          // ),
          // Card con lista de mobiliario
          RentDetailsSelectedFurniture(rentId: widget.rentId!),
          _buttonToSetState(widget.rentId!),
        ],
      ),
    );
  }

  _buttonToSetState(int idRent) {
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
              onPressed: () {
                String? state;
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Marcar renta como'),
                    content: SingleChildScrollView(
                      child: StatefulBuilder(
                        builder: (context, setState) {
                          return Column(
                            children: [
                              ListTile(
                                title: Text('Por cumplir'),
                                leading: Radio(
                                  value: "Por cumplir",
                                  groupValue: state,
                                  onChanged: (String? selectedState) {
                                    setState(() {
                                      state = selectedState;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: Text('En proceso'),
                                leading: Radio(
                                  value: "En proceso",
                                  groupValue: state,
                                  onChanged: (String? selectedState) {
                                    setState(() {
                                      state = selectedState;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: Text('Cumplida'),
                                leading: Radio(
                                  value: "Cumplida",
                                  groupValue: state,
                                  onChanged: (String? selectedState) {
                                    setState(() {
                                      state = selectedState;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: Text('Cancelada'),
                                leading: Radio(
                                  value: "Cancelada",
                                  groupValue: state,
                                  onChanged: (String? selectedState) {
                                    setState(() {
                                      state = selectedState;
                                    });
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Abortar'),
                      ),
                      TextButton(
                        onPressed: () async {
                          //Actualizar el estado de la renta
                          Rent rentToUpdate =
                              await DatabaseHelper().getRentByRentId(idRent);
                          rentToUpdate.state = state!;
                          await DatabaseHelper().updateRent(rentToUpdate);
                          Provider.of<RentProvider>(context, listen: false)
                              .updateRent(rentToUpdate);

                          // Actualizar la lista de rentas pendientes
                          String rentState = 'Por cumplir';
                          List<Rent> updatedPendingList =
                              await DatabaseHelper().getRentsByState(rentState);
                          Provider.of<RentListProvider>(context, listen: false)
                              .updateRentPendingList(updatedPendingList);

                          // Actualizar la lista del historial de rentas
                          List<Rent> updatedHistoryList = await DatabaseHelper()
                              .getRentsByOtherState(rentState);
                          Provider.of<RentListProvider>(context, listen: false)
                              .updateRentHistoryList(updatedHistoryList);

                          //print(state);
                          Navigator.pop(context);

                          // mostrar mensaje
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              content: const Text('Renta actualizada'),
                              action: SnackBarAction(
                                textColor: Theme.of(context).primaryColor,
                                label: 'OK',
                                onPressed: () {},
                              ),
                            ),
                          );
                        },
                        child: const Text('Confirmar'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Marcar como'),
            ),
          ),
        ],
      ),
    );
  }
}
