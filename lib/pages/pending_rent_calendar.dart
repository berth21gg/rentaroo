import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class PendingRentCalendarScreen extends StatefulWidget {
  const PendingRentCalendarScreen({super.key});

  @override
  State<PendingRentCalendarScreen> createState() =>
      _PendingRentCalendarScreenState();
}

class _PendingRentCalendarScreenState extends State<PendingRentCalendarScreen> {
  // Día actual
  DateTime today = DateTime.now();
  // Día seleccionado
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Selected Day = ${today.toString().split(" ")[0]}'),
            TableCalendar(
              locale: "es_MX",
              headerStyle: const HeaderStyle(
                  formatButtonVisible: false, titleCentered: true),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime.utc(2024, 01, 01),
              lastDay: DateTime.utc(2030, 12, 31),
              onDaySelected: _onDaySelected,
            ),
          ],
        ),
      ),
    );
  }
}
