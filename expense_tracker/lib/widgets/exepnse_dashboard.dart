import 'package:expense_tracker/database/expense_database.dart';
import 'package:expense_tracker/widgets/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Period {
  weekly('This week'),
  monthly('This month'),
  yearly('This year');

  final String name;
  const Period(this.name);
}

class ExpenseDashboard extends StatefulWidget {
  const ExpenseDashboard({super.key});

  @override
  State<ExpenseDashboard> createState() => _ExpenseDashboardState();
}

class _ExpenseDashboardState extends State<ExpenseDashboard> {
  var _selectPeriod = Period.weekly;
  double expense = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseDatabase>(
      builder: (context, expenseDb, child) {
        return FutureBuilder<Map<String, double>>(
          future: _getData(expenseDb),
          builder: (context, snapshot) {
            final dataMap = snapshot.data ?? {'No Data': 100};

            return Container(
              margin: const EdgeInsets.only(top: 7),
              padding: const EdgeInsets.all(15),
              width: 380,
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    offset: const Offset(3, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DropdownButton<Period>(
                        value: _selectPeriod,
                        items: Period.values.map((period) {
                          return DropdownMenuItem<Period>(
                            value: period,
                            child: Text(period.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _selectPeriod = value;
                            });
                          }
                        },
                        hint: const Text('Select a Category'),
                      ),
                      Text("\$ $expense")
                    ],
                  ),
                  const SizedBox(height: 15),
                  PieChartWidget(dataMap: dataMap),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<Map<String, double>> _getData(ExpenseDatabase expenseDb) {
    switch (_selectPeriod) {
      case Period.weekly:
        expense = expenseDb.weeklyExpense;
        return expenseDb.getWeeklyCategoryExpense();
      case Period.monthly:
        expense = expenseDb.monthlyExpense;
        return expenseDb.getMonthlyCategoryExpense();
      case Period.yearly:
        expense = expenseDb.yearlyExpense;
        return expenseDb.getYearlyCategoryExpense();
    }
  }
}
