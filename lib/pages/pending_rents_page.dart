import 'package:flutter/material.dart';

class PendingRentPage extends StatefulWidget {
  const PendingRentPage({super.key});

  @override
  State<PendingRentPage> createState() => _PendingRentPageState();
}

class _PendingRentPageState extends State<PendingRentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rentas pendientes"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "Lista de rentas pendientes",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
