import 'package:flutter/material.dart';
import 'package:rentaroo/pages/pending_rents_page.dart';
import 'package:rentaroo/pages/rent_history_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  final List<Widget> screens = [PendingRentPage(), RentHistoryPage()];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = PendingRentPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Tab Bar Icons
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = PendingRentPage();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.pending_actions,
                          color: currentTab == 0
                              ? Theme.of(context).colorScheme.secondary
                              : Colors.grey,
                        ),
                        Text(
                          'Pending',
                          style: TextStyle(
                              color: currentScreen == 0
                                  ? Theme.of(context).colorScheme.secondary
                                  : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Right Tab Bar Icons
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = RentHistoryPage();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.history,
                          color: currentTab == 1
                              ? Theme.of(context).colorScheme.secondary
                              : Colors.grey,
                        ),
                        Text(
                          'History',
                          style: TextStyle(
                              color: currentScreen == 1
                                  ? Theme.of(context).colorScheme.secondary
                                  : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
