import 'package:flutter/material.dart';

class PendingRentListScreen extends StatefulWidget {
  const PendingRentListScreen({super.key});

  @override
  State<PendingRentListScreen> createState() => _PendingRentListScreenState();
}

class _PendingRentListScreenState extends State<PendingRentListScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Lista de rentas pendites',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
