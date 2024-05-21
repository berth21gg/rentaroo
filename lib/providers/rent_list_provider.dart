import 'package:flutter/material.dart';
import 'package:rentaroo/models/rent_model.dart';

class RentListProvider extends ChangeNotifier {
  List<Rent> _rentPendingList = [];
  List<Rent> _rentHistoryList = [];

  List<Rent> get rentPendingList => _rentPendingList;
  List<Rent> get rentHistoryList => _rentHistoryList;

  // Método para actualizar la lista de rentas pendiente
  void updateRentPendingList(List<Rent> newList) {
    _rentPendingList = newList;
    notifyListeners();
  }

  // Método para actualizar la lista del historial de rentas
  void updateRentHistoryList(List<Rent> newList) {
    _rentHistoryList = newList;
    notifyListeners();
  }
}
