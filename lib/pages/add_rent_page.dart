import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rentaroo/database/databaseHelper.dart';
import 'package:rentaroo/models/rent_model.dart';
import 'package:rentaroo/pages/category_page.dart';

class AddRentPage extends StatefulWidget {
  const AddRentPage({super.key});

  @override
  State<AddRentPage> createState() => _AddRentPageState();
}

class _AddRentPageState extends State<AddRentPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  late DateTime _startDate;
  late DateTime _dueDate;

  Future<void> _selectStartDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(2024),
        lastDate: DateTime(2030));
    if (picked != null) {
      setState(() {
        _startDate = picked;
      });
    } else {
      setState(() {
        _startDate = now;
      });
    }
  }

  Future<void> _selectDueDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(2024),
        lastDate: DateTime(2030));
    if (picked != null) {
      setState(() {
        _dueDate = picked;
      });
    } else {
      setState(() {
        _dueDate = now;
      });
    }
  }

  // Controladores para fecha de inicio y fin
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _dueDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Nueva renta'),
          centerTitle: true,
          // Boton regresar para cancelar la renta
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Título de la renta',
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresea tu nombre';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _name = value!;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _startDateController,
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      await _selectStartDate(context);
                      _startDateController.text =
                          DateFormat.yMd().format(_startDate);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Fecha de inicio',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Fecha de inicio requerida';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      setState(() {
                        _startDate = _startDate;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _dueDateController,
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      await _selectDueDate(context);
                      _dueDateController.text =
                          DateFormat.yMd().format(_dueDate);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Fecha de vencimiento',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Fecha de inicio requerida';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      setState(() {
                        _dueDate = _dueDate;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        // Calcular la fecha de recordatorio 2 días antes de la fecha de inicio
                        DateTime _reminderDate =
                            _startDate.subtract(Duration(days: 2));

                        // Crear una instancia del modelo Rent
                        DateTime _newStartDate = DateTime(
                            _startDate.year, _startDate.month, _startDate.day);
                        print(_newStartDate.millisecondsSinceEpoch);
                        Rent newRent = Rent(
                          title: _name,
                          startDate: _newStartDate,
                          dueDate: _dueDate,
                          reminderDate: _reminderDate,
                          state: DateFormat.yMd().format(_startDate) ==
                                  DateFormat.yMd().format(DateTime.now())
                              ? 'En proceso'
                              : 'Por cumplir',
                        );
                        try {
                          // Insertar la nueva renta
                          await DatabaseHelper().insertRent(newRent);

                          // // Mostrar un mensaje
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   SnackBar(content: Text('Renta agregada con éxito')),
                          // );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CategoryPage(),
                            ),
                          );
                        } catch (e) {
                          print('Error al insertar renta: $e');
                        }
                      }
                    },
                    child: Text('Continuar'),
                  ),
                ],
              )),
        ));
  }
}
