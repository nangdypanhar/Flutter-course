import 'package:expense_tracker/Models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseTile extends StatelessWidget {
  final Expense expense;
  final VoidCallback onTap;
  const ExpenseTile({super.key, required this.expense, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(expense.category.image),
          ),
          title: Text(expense.title),
          subtitle: Text(expense.category.name),
          trailing: Text(
            "\$ ${expense.amount.toString()}",
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
