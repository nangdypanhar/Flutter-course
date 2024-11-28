import 'package:flutter/material.dart';
import 'package:starter_app/W8-S1/model/expense.dart';
import 'package:starter_app/W8-S1/screen/expense_list.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  List<Expense> expenses = [
    Expense(
      title: "Coconut",
      amount: 10,
      date: DateTime.now(),
      expenseType: ExpenseType.food.label,
    ),
    Expense(
      title: "Banana",
      amount: 10,
      date: DateTime.now(),
      expenseType: ExpenseType.food.label,
    ),
    Expense(
      title: "Movie",
      amount: 10,
      date: DateTime.now(),
      expenseType: ExpenseType.leisure.label,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpenseList(
        expenses: expenses,
      ),
    );
  }
}
