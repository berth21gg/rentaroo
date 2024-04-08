import 'package:flutter/material.dart';
import 'package:rentaroo/database/databaseHelper.dart';
import 'package:rentaroo/models/rent_model.dart';

class PendingRentCalendarScreen extends StatefulWidget {
  const PendingRentCalendarScreen({super.key});

  @override
  State<PendingRentCalendarScreen> createState() =>
      _PendingRentCalendarScreenState();
}

class _PendingRentCalendarScreenState extends State<PendingRentCalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset('assets/images/sillas/silla_bambu.jpg'),
    );
  }
}
