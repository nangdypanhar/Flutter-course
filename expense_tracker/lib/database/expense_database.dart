import 'package:expense_tracker/Models/expense.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class ExpenseDatabase extends ChangeNotifier {
  static late Isar isar;
  final List<Expense> expenseList = [];
  double _weeklyExpense = 0;
  double _monthlyExpense = 0;
  double _yearlyExpense = 0;

  double get weeklyExpense => _weeklyExpense;
  double get monthlyExpense => _monthlyExpense;
  double get yearlyExpense => _yearlyExpense;

  Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([ExpenseSchema], directory: dir.path);

    await fetchExpenses();
  }

  Future<void> fetchExpenses() async {
    List<Expense> fetchExpenses = await isar.expenses.where().findAll();
    expenseList.clear();
    expenseList.addAll(fetchExpenses);
    getWeeklyExpense();
    getMonthlyExpense();
    getYearlyExpense();
    notifyListeners();
  }

  Future<void> addExpense(Expense newExpense) async {
    await isar.writeTxn(() => isar.expenses.put(newExpense));
    expenseList.add(newExpense);
    await fetchExpenses();
  }

  Future<void> updateExpense(int id, Expense updatedExpense) async {
    final existingExpense = await isar.expenses.get(id);

    if (existingExpense != null) {
      existingExpense.title = updatedExpense.title;
      existingExpense.amount = updatedExpense.amount;
      existingExpense.category = updatedExpense.category;
      existingExpense.date = updatedExpense.date;

      await isar.writeTxn(() => isar.expenses.put(existingExpense));

      await fetchExpenses();
    }
  }

  Future<void> deleteExpense(int id) async {
    await isar.writeTxn(() => isar.expenses.delete(id));

    await fetchExpenses();
  }

  Future<Map<String, double>> getCategoryExpenseSummary(
      {required DateTime startDate, required DateTime endDate}) async {
    final List<Expense> filteredExpenses = await isar.expenses
        .filter()
        .dateGreaterThan(startDate)
        .and()
        .dateLessThan(endDate)
        .findAll();

    final Map<String, double> categoryTotals = {};

    for (var expense in filteredExpenses) {
      categoryTotals[expense.category.name] =
          (categoryTotals[expense.category.name] ?? 0) + expense.amount;
    }
    notifyListeners();
    return categoryTotals;
  }

  Future<Map<String, double>> getWeeklyCategoryExpense() async {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));
    return await getCategoryExpenseSummary(
        startDate: startOfWeek, endDate: endOfWeek);
  }

  Future<Map<String, double>> getMonthlyCategoryExpense() async {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth =
        DateTime(now.year, now.month + 1, 1).subtract(const Duration(days: 1));
    return await getCategoryExpenseSummary(
        startDate: startOfMonth, endDate: endOfMonth);
  }

  Future<Map<String, double>> getYearlyCategoryExpense() async {
    final now = DateTime.now();
    final startOfYear = DateTime(now.year, 1, 1);
    final endOfYear = DateTime(now.year, 12, 31);
    return await getCategoryExpenseSummary(
        startDate: startOfYear, endDate: endOfYear);
  }

  Future<void> getWeeklyExpense() async {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));

    final List<Expense> weeklyExpenses = await isar.expenses
        .filter()
        .dateGreaterThan(startOfWeek)
        .and()
        .dateLessThan(endOfWeek)
        .findAll();

    double totalExpense = 0.0;

    for (var expense in weeklyExpenses) {
      totalExpense += expense.amount;
    }
    _weeklyExpense = totalExpense;
  }

  Future<void> getMonthlyExpense() async {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth =
        DateTime(now.year, now.month + 1, 1).subtract(const Duration(days: 1));

    final List<Expense> monthlyExpense = await isar.expenses
        .filter()
        .dateGreaterThan(startOfMonth)
        .and()
        .dateLessThan(endOfMonth)
        .findAll();

    double totalExpense = 0.0;

    for (var expense in monthlyExpense) {
      totalExpense += expense.amount;
    }
    _monthlyExpense = totalExpense;
  }

  Future<void> getYearlyExpense() async {
    final now = DateTime.now();
    final startOfYear = DateTime(now.year, 1, 1);
    final endOfYear = DateTime(now.year, 12, 31);

    final List<Expense> yearlyExpense = await isar.expenses
        .filter()
        .dateGreaterThan(startOfYear)
        .and()
        .dateLessThan(endOfYear)
        .findAll();
    double totalExpense = 0.0;

    for (var expense in yearlyExpense) {
      totalExpense += expense.amount;
    }
    _yearlyExpense = totalExpense;
  }
}
