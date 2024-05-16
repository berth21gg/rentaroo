import 'package:flutter/material.dart';
import 'package:rentaroo/models/rent_model.dart';

class RentProvider extends ChangeNotifier {
  Rent _rent = Rent(
      title: '',
      startDate: DateTime.now(),
      dueDate: DateTime.now(),
      reminderDate: DateTime.now(),
      state: '');

  Rent get rent => _rent;

  void updateRent(Rent newRent) {
    _rent = newRent;
    notifyListeners();
  }
}
