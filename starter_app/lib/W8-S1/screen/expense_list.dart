import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:starter_app/W8-S1/model/expense.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenses;
  const ExpenseList({super.key, required this.expenses});

  Icon getIcon(String expenseType) {
    switch (expenseType) {
      case "food":
        return const Icon(Icons.local_pizza);
      case "travel":
        return const Icon(Icons.directions_bike);
      case "leisure":
        return const Icon(Icons.movie);
      case "work":
        return const Icon(Icons.work);
      default:
        return const Icon(Icons.help_center_outlined);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        var expense = expenses[index];
        String date = DateFormat('dd/MM/yyyy').format(expense.date);

        return Card(
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(expense.title),
                    Text("\$ ${expense.amount}"),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    getIcon(expense.expenseType),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(date),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
