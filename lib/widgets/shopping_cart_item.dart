import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentaroo/providers/count_provider.dart';

class ShoppingCartItem extends StatefulWidget {
  final String description;
  final double price;
  final String imageFurniture;
  final int quantity;
  const ShoppingCartItem(
      {super.key,
      required this.description,
      required this.price,
      required this.imageFurniture,
      required this.quantity});

  @override
  State<ShoppingCartItem> createState() => _ShoppingCartItemState();
}

class _ShoppingCartItemState extends State<ShoppingCartItem> {
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.description,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Cantidad seleccionada: ${widget.quantity}',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onPressed: () {
                            countModel
                                .deleteItemForSelectedList(widget.description);
                          },
                          child: Row(
                            children: [
                              Text('Eliminar'),
                              Icon(
                                Icons.delete,
                                size: 20.0,
                              ),
                            ],
                          ),
                        ),
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
