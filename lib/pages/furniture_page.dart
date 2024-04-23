import 'package:flutter/material.dart';

class FurniturePage extends StatefulWidget {
  final String categoryName;
  const FurniturePage({super.key, required this.categoryName});

  @override
  State<FurniturePage> createState() => _FurniturePageState();
}

class _FurniturePageState extends State<FurniturePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Mobiliario de ${widget.categoryName}'),
      ),
    );
  }
}
