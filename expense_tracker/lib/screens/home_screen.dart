import 'package:expense_tracker/screens/chart_screen.dart';
import 'package:expense_tracker/screens/form_screen.dart';
import 'package:expense_tracker/widgets/exepnse_dashboard.dart';
import 'package:expense_tracker/widgets/expense_list.dart';
import 'package:expense_tracker/widgets/header.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      SafeArea(
        child: Column(
          children: [
            const Header(),
            const ExpenseDashboard(),
            getViewAll(context),
            const Expanded(
              child: ExpenseList(),
            ),
          ],
        ),
      ),
      const ChartScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(40),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.symmetric(
              horizontal: BorderSide(
                color: Colors.grey.withOpacity(0.3),
              ),
            ),
          ),
          child: NavigationBar(
            elevation: 10,
            selectedIndex: selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Icons.home,
                  color: selectedIndex == 0 ? Colors.grey[200]! : Colors.black,
                ),
                label: "Home",
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.bar_chart,
                  color: selectedIndex == 1 ? Colors.grey[200]! : Colors.black,
                ),
                label: "Charts",
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => const FormScreen(
                mode: Mode.create,
              ),
            ),
          );
        },
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      body: _pages[selectedIndex],
    );
  }

  Widget getViewAll(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Expense",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const ChartScreen(),
                ),
              );
            },
            child: Text(
              "View all",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
