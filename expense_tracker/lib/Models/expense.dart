import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:isar/isar.dart';

import '../utils/image_path.dart';

part 'expense.g.dart';


@CopyWith()
@Collection()
class Expense {
  Id expenseId = Isar.autoIncrement;
  late String title;
  late double amount;
  late DateTime date;

  @enumerated
  late Category category;

   Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category
  });

}
