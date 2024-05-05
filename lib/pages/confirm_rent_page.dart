import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rentaroo/models/rent_model.dart';
import 'package:rentaroo/providers/count_provider.dart';
import 'package:rentaroo/widgets/detail_confirm_card.dart';
import 'package:rentaroo/database/databaseHelper.dart';
import 'package:rentaroo/widgets/selected_furniture_confirm_card.dart';

class ConfirmRentPage extends StatefulWidget {
  const ConfirmRentPage({super.key});

  @override
  State<ConfirmRentPage> createState() => _ConfirmRentPageState();
}

class _ConfirmRentPageState extends State<ConfirmRentPage> {
  Rent lastRent = Rent(
      title: '',
      startDate: DateTime.now(),
      dueDate: DateTime.now(),
      reminderDate: DateTime.now(),
      state: '');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadLastRent();
  }

  Future<void> loadLastRent() async {
    try {
      Rent? rent = await DatabaseHelper().getLastRent();
      setState(() {
        lastRent = rent!;
      });
    } catch (e) {
      print('Error loading last rent: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmar renta'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          DetailConfirmCard(
            title: lastRent.title,
            startDate: lastRent.startDate,
            dueDate: lastRent.dueDate,
          ),
          const SelectedFurnitureConfirmCard(),
          //Spacer(),
          _buttonsToConfirmRent(),
        ],
      ),
    );
  }

  _buttonsToConfirmRent() {
    final provider = Provider.of<CountModel>(context, listen: false);
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
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Cancelar Registro'),
                    content:
                        const Text('¿Desea cancelar el registro de la renta?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'No'),
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, 'Si');
                          Navigator.popUntil(context,
                              ModalRoute.withName('/')); // Regresar al home
                          try {
                            provider.deleteAllItemFromSelectedList();
                          } catch (e) {
                            print('Hubo un problema al limpiar el carrito: $e');
                          }
                        },
                        child: const Text('Si'),
                      ),
                    ],
                  ),
                ).then((value) {
                  if (value != null && value == 'Si') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        content: Text('Registro cancelado'),
                        action: SnackBarAction(
                            textColor: Theme.of(context).primaryColor,
                            label: 'OK',
                            onPressed: () {}),
                      ),
                    );
                  }
                });
              },
              child: const Text('Cancelar'),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {},
              child: const Text('Confirmar'),
            ),
          ),
        ],
      ),
    );
  }
}
