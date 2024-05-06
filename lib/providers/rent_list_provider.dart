import 'package:flutter/material.dart';
import 'package:rentaroo/models/rent_model.dart';

class RentListProvider extends ChangeNotifier {
  List<Rent> _rentList = [];

  List<Rent> get rentList => _rentList;

  // Método para actualizar la lista de rentas
  void updateRentList(List<Rent> newList) {
    _rentList = newList;
    notifyListeners();
  }
}
