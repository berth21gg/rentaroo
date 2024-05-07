import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PendingRentCard extends StatefulWidget {
  final String title;
  final DateTime startDate;
  final DateTime dueDate;
  final String state;
  final VoidCallback onTap;
  const PendingRentCard(
      {super.key,
      required this.title,
      required this.startDate,
      required this.dueDate,
      required this.state,
      required this.onTap});

  @override
  State<PendingRentCard> createState() => _PendingRentCardState();
}

class _PendingRentCardState extends State<PendingRentCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Container(
                height: 100,
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          size: 20,
                        ),
                        const Text(
                          'Inicio ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(DateFormat.yMd().format(widget.startDate)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              size: 20,
                            ),
                            const Text(
                              'Fin ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Text(DateFormat.yMd().format(widget.dueDate)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              widget.state,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Icon(
                              Icons.circle,
                              color: getDynamicColor(widget.state),
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                child: Container(
                  width: 6,
                  color: getDynamicColor(widget.state),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color getDynamicColor(String status) {
    switch (status) {
      case 'En proceso':
        return Colors.blue;
      case 'Por cumplir':
        return Colors.yellow;
      case 'Cumplida':
        return Colors.green;
      case 'Cancelada':
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}
