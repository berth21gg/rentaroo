import 'package:flutter/material.dart';

class PendingRentCalendarScreen extends StatefulWidget {
  const PendingRentCalendarScreen({super.key});

  @override
  State<PendingRentCalendarScreen> createState() =>
      _PendingRentCalendarScreenState();
}

class _PendingRentCalendarScreenState extends State<PendingRentCalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Calendario de rentas pendites',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
