import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onExpenseRemoved});

  final List<Expense> expenses;

  final Function(Expense) onExpenseRemoved;

  @override
  Widget build(BuildContext context) {
    bool isEmpty = expenses.isEmpty;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      // Exercise 03 Q1
      child: isEmpty
          ? const Center(
              child: Text("No Expense Found. Start Adding some !"),
            )
          : ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) => Dismissible(
                onDismissed: (direction) => onExpenseRemoved(
                  expenses[index],
                ),
                key: Key(expenses[index].id),
                child: ExpenseItem(expenses[index]),
              ),
            ),
    );
  }
}
