import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailConfirmCard extends StatelessWidget {
  final String title;
  final DateTime startDate;
  final DateTime dueDate;

  const DetailConfirmCard({
    super.key,
    required this.title,
    required this.startDate,
    required this.dueDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Fecha de inicio',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Fecha de vcto.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(DateFormat.yMd().format(startDate)),
                  Text(DateFormat.yMd().format(dueDate)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
