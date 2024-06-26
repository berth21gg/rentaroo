import 'package:flutter/material.dart';
import 'package:rentaroo/database/databaseHelper.dart';
import 'package:rentaroo/models/rent_model.dart';
import 'package:rentaroo/pages/rent_details_page.dart';
import 'package:rentaroo/widgets/pending_rent_card.dart';
import 'package:table_calendar/table_calendar.dart';

class PendingRentCalendarScreen extends StatefulWidget {
  const PendingRentCalendarScreen({super.key});

  @override
  State<PendingRentCalendarScreen> createState() =>
      _PendingRentCalendarScreenState();
}

class _PendingRentCalendarScreenState extends State<PendingRentCalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime now = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final String state = 'Por cumplir';

  Map<DateTime, List<Rent>> rents = {};
  late final ValueNotifier<List<Rent>> _selectedRents;

  @override
  void initState() {
    super.initState();
    _selectedDay =
        DateTime(_focusedDay.year, _focusedDay.month, _focusedDay.day);
    _selectedRents = ValueNotifier([]);
    _fetchAllRents();
  }

  // Normalizado de fecha
  DateTime _normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  // Carga rentas de todos los días
  Future<void> _fetchAllRents() async {
    try {
      List<Rent> allRents = await DatabaseHelper().getRentsByState(state);
      Map<DateTime, List<Rent>> rentMap = {};
      for (var rent in allRents) {
        DateTime rentDay = _normalizeDate(rent.startDate);
        if (rentMap[rentDay] == null) {
          rentMap[rentDay] = [];
        }
        rentMap[rentDay]!.add(rent);
      }
      setState(() {
        rents = rentMap;
        if (rents.containsKey(_selectedDay)) {
          _selectedRents.value = rents[_selectedDay]!;
        }
      });
    } catch (e) {
      print('Ocurrió un error al cargar las rentas: $e');
    }
  }

  // Día seleccionado
  _onDaySelected(DateTime selectedDay, DateTime focusedDay) async {
    setState(() {
      _selectedDay = _normalizeDate(selectedDay);
      _focusedDay = focusedDay;
    });

    List<Rent> rentsByDay = await DatabaseHelper().getRentsByStartDateAndState(
        _normalizeDate(selectedDay).millisecondsSinceEpoch, state);

    setState(() {
      rents[selectedDay] = rentsByDay;
      _selectedRents.value = rentsByDay;
    });

    if (_selectedRents.value.isNotEmpty) {
      return showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 350,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  Expanded(
                      child: ValueListenableBuilder<List<Rent>>(
                    valueListenable: _selectedRents,
                    builder: (context, value, _) {
                      return ListView.builder(
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          Rent rent = value[index];
                          return Hero(
                            tag: rent.id!,
                            child: PendingRentCard(
                              title: rent.title,
                              startDate: rent.startDate,
                              dueDate: rent.dueDate,
                              state: rent.state,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        RentDetailsPage(rentId: rent.id),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ))
                ],
              ),
            ),
          );
        },
      );
    }
  }

  List<Rent> _getRentsByDay(DateTime day) {
    DateTime normalizedDay = _normalizeDate(day);
    return rents[normalizedDay] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TableCalendar(
              locale: "es_MX",
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(2024, 01, 01),
              lastDay: DateTime.utc(2030, 12, 31),
              onDaySelected: _onDaySelected,
              calendarFormat: _calendarFormat,
              startingDayOfWeek: StartingDayOfWeek.monday,
              eventLoader: _getRentsByDay,
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
                selectedDecoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle,
                ),
                todayDecoration: const BoxDecoration(
                  color: Color.fromARGB(255, 189, 126, 95),
                  shape: BoxShape.circle,
                ),
              ),
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, day, events) {
                  if (events.isNotEmpty) {
                    return Positioned(
                        bottom: 1,
                        right: 1,
                        child: _buildEventsMarker(day, events.length));
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildEventsMarker(DateTime day, int eventCount) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '$eventCount',
          style:
              const TextStyle().copyWith(color: Colors.white, fontSize: 12.0),
        ),
      ),
    );
  }
}
