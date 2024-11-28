import 'package:uuid/uuid.dart';

enum ExpenseType {
  food("food"),
  travel("travel"),
  leisure("leisure"),
  work("work");

  final String label;
  const ExpenseType(this.label);

  @override
  String toString() => label;
}

class Expense {
  static Uuid uuid = const Uuid();
  final String id;
  final String title;
  final String expenseType;
  final double amount;
  DateTime date;

  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.expenseType})
      : id = uuid.v4();

  @override
  String toString() {
    return "$title , $amount , $date , $expenseType";
  }
}

