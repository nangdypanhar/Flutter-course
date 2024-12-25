import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:expense_tracker/Models/expense.dart';
import 'package:expense_tracker/database/expense_database.dart';
import 'package:expense_tracker/screens/form_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'expense_tile.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key});

  void _deleteExpense(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(
            'Delete Expense',
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          ),
          content: Text(
            'Are you sure you want to delete this expense?',
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: Text(
                'Cancel',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
            TextButton(
              onPressed: () {
                final expenseDatabase =
                    Provider.of<ExpenseDatabase>(dialogContext, listen: false);
                expenseDatabase.deleteExpense(id);
                Navigator.of(dialogContext).pop();
                DelightToastBar(
                  builder: (toastContext) => const ToastCard(
                    title: Text('Delete successful'),
                    leading: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                  ),
                  autoDismiss: true,
                  snackbarDuration: Durations.extralong4,
                ).show(dialogContext);
              },
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showBottomSheet(BuildContext context, Expense expense) {
    showModalBottomSheet(
      context: context,
      builder: (context) => _buildBottomSheetContent(context, expense),
    );
  }

  Widget _buildBottomSheetContent(BuildContext context, Expense expense) {
    final dateFormatted = DateFormat('dd/MMM/yyyy').format(expense.date);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        height: 300,
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(expense.category.image),
              radius: 70,
            ),
            Text(
              expense.title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(height: 10),
            Text(
              "Amount: \$${expense.amount}",
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),
            Text(
              "Category: ${expense.category.name}",
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),
            Text(
              " Date :  $dateFormatted",
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => FormScreen(
                          mode: Mode.edit,
                          expense: expense,
                        ),
                      ),
                    );
                  },
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.yellow[50]),
                  child: Text(
                    "Edit",
                    style: TextStyle(
                      color: Colors.yellow[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _deleteExpense(context, expense.expenseId);
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.red[100]),
                  child: Text(
                    "Remove",
                    style: TextStyle(
                      color: Colors.red[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseDatabase>(
        builder: (context, expenseDatabase, child) {
      final expenseList = expenseDatabase.expenseList;

      if (expenseList.isEmpty) {
        return const Center(child: Text('No expenses found.'));
      }

      return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: expenseList.length,
          itemBuilder: (context, index) {
            var expenseItem = expenseList[index];
            return ExpenseTile(
              expense: expenseItem,
              onTap: () => _showBottomSheet(context, expenseItem),
            );
          },
        ),
      );
    });
  }
}