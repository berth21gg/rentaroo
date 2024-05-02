import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import 'package:provider/provider.dart';
import 'package:rentaroo/models/furniture_model.dart';
import 'package:rentaroo/providers/count_provider.dart';

class FurnitureCard extends StatefulWidget {
  final int id;
  final String category;
  final String name;
  final int stock;
  final double price;
  final String imageFurniture;
  const FurnitureCard({
    super.key,
    required this.id,
    required this.category,
    required this.name,
    required this.stock,
    required this.price,
    required this.imageFurniture,
  });

  @override
  State<FurnitureCard> createState() => _FurnitureCardState();
}

class _FurnitureCardState extends State<FurnitureCard> {
  //int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<CountModel>(
      builder: (context, countModel, _) => Card(
        elevation: 3,
        margin: EdgeInsets.all(8),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Imagen del mobiliario
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(widget.imageFurniture),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              // Nombre, stock y precio
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nombre
                    Text(
                      widget.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    // stock
                    Text(
                      'Stock disponible: ${widget.stock}',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    // Contador de cantidad y precio
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // contador de cantidad
                        ItemCount(
                          initialValue:
                              countModel.getCountForFurniture(widget.name),
                          minValue: 0,
                          maxValue: widget.stock,
                          onChanged: (value) {
                            setState(() {
                              countModel.setCountForFurniture(
                                  widget.name,
                                  value.toInt(),
                                  Furniture(
                                      id: widget.id,
                                      category: widget.category,
                                      description: widget.name,
                                      stock: widget.stock,
                                      price: widget.price,
                                      image: widget.imageFurniture));
                            });
                          },
                          decimalPlaces: 0,
                        ),
                        // Precio
                        Text(
                          '\$${widget.price}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
