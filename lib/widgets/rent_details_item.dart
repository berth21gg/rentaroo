import 'package:flutter/material.dart';

class RentDetailsItems extends StatefulWidget {
  final String description;
  final double price;
  final String imageFurniture;
  final int quantity;
  const RentDetailsItems(
      {super.key,
      required this.description,
      required this.price,
      required this.imageFurniture,
      required this.quantity});

  @override
  State<RentDetailsItems> createState() => _RentDetailsItemsState();
}

class _RentDetailsItemsState extends State<RentDetailsItems> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8),
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
            const SizedBox(
              width: 12,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.description,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Cantidad seleccionada: ${widget.quantity}',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '\$${widget.price}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
