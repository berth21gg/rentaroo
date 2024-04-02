import 'package:flutter/material.dart';

class RentHistoryPage extends StatefulWidget {
  const RentHistoryPage({super.key});

  @override
  State<RentHistoryPage> createState() => _RentHistoryPageState();
}

class _RentHistoryPageState extends State<RentHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historial de rentas"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "Historial de rentas",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
