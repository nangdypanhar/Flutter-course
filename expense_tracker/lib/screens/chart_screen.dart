import 'package:expense_tracker/graph/bar_graph.dart';
import 'package:expense_tracker/widgets/expense_list.dart';
import 'package:flutter/material.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<double> weeklySummary = [
      20.7865,
      45.4231,
      12.5634,
      19.8765,
      15.9821,
      18.2347,
      60.5,
      22.0987,
      14.4567,
      10.9823,
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Expense"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              height: 300,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: MyBarGraph(
                weeklySummary: weeklySummary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                "Expense",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            const Expanded(child: ExpenseList())
          ],
        ),
      ),
    );
  }
}
