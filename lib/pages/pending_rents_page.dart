import 'package:flutter/material.dart';
import 'package:rentaroo/pages/pending_rent_calendar.dart';
import 'package:rentaroo/pages/pending_rent_list.dart';

class PendingRentPage extends StatefulWidget {
  const PendingRentPage({super.key});

  @override
  State<PendingRentPage> createState() => _PendingRentPageState();
}

class _PendingRentPageState extends State<PendingRentPage> {
  // PageController para controlar las páginas
  final PageController _pageController = PageController();

  // Índice de la página actual
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rentas pendientes"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ToggleButtons(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.calendar_month),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.list),
                ),
              ],
              onPressed: (index) {
                // Cambia a la página seleccionada
                _pageController.animateToPage(
                  index,
                  duration: Duration(microseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              isSelected:
                  _currentPageIndex == 0 ? [true, false] : [false, true],
            ),
          ),
          Expanded(
              child: PageView(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                _currentPageIndex = value;
              });
            },
            children: [
              PendingRentCalendarScreen(),
              PendingRentListScreen(),
            ],
          ))
        ],
      ),
    );
  }
}
