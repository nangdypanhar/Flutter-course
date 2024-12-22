import 'package:expense_tracker/screens/chart_screen.dart';
import 'package:expense_tracker/screens/form_screen.dart';
import 'package:expense_tracker/utils/image_path.dart';
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

  final List<Widget> _pages = [
    const SafeArea(
      child: Column(
        children: [
          Header(),
          ExpenseDashboard(),
          Expanded(
            child: ExpenseList(),
          ),
        ],
      ),
    ),
    const ChartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   title: const Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text(
      //         "Welcome Back",
      //         style: TextStyle(fontSize: 15),
      //       ),
      //       Text(
      //         "Nangdy Panhar",
      //         style: TextStyle(fontSize: 20),
      //       ),
      //     ],
      //   ),
      //   actions: [
      //     const Icon(
      //       Icons.sunny,
      //       color: Colors.grey,
      //     ),
      //     const SizedBox(
      //       width: 20,
      //     ),
      //     CircleAvatar(
      //       radius: 25,
      //       backgroundImage: AssetImage(Avatar.man.path),
      //     ),
      //   ],
      // ),
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
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              NavigationDestination(
                icon: Icon(Icons.bar_chart),
                label: "Charts",
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
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
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      body: _pages[selectedIndex],
    );
  }
}
