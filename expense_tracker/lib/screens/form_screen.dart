import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:expense_tracker/Models/expense.dart';
import 'package:expense_tracker/database/expense_database.dart';
import 'package:expense_tracker/utils/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

enum Mode {
  create,
  edit,
}

class FormScreen extends StatefulWidget {
  final Expense? expense;
  final Mode mode;
  const FormScreen({super.key, required this.mode, this.expense});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();

  late Category selectedCategory;
  late String title;
  late double amount;
  late DateTime date;

  @override
  void initState() {
    super.initState();
    if (widget.mode == Mode.edit) {
      title = widget.expense!.title;
      amount = widget.expense!.amount;
      date = widget.expense!.date;
      selectedCategory = widget.expense!.category;
      _dateController.text = DateFormat('dd/MM/yyyy').format(date);
    } else {
      title = '';
      amount = 0;
      date = DateTime.now();
      selectedCategory = Category.education;
    }
  }

  String? validateTitle(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.trim().length <= 1 ||
        value.trim().length > 50) {
      return 'Must be between 1 and 50 characters.';
    }
    return null;
  }

  String? validateQuantity(String? value) {
    amount = double.tryParse(value!) ?? 0;
    if (amount <= 0) {
      return 'Must be a valid, positive number.';
    }
    return null;
  }

  void addExpense(Expense newExpense) {
    bool isValid = _formKey.currentState!.validate();
    final expenseDatabase =
        Provider.of<ExpenseDatabase>(context, listen: false);

    if (isValid) {
      expenseDatabase.addExpense(newExpense);
      Navigator.pop(context);

      DelightToastBar(
        builder: (toastContext) => const ToastCard(
          title: Text('Create successful'),
          leading: Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
        ),
        autoDismiss: true,
        snackbarDuration: Durations.extralong4,
      ).show(context);
    }
  }

  void updatedExpense(int id, Expense updatedExpense) {
    bool isValid = _formKey.currentState!.validate();

    final expenseDatabase =
        Provider.of<ExpenseDatabase>(context, listen: false);

    if (isValid) {
      expenseDatabase.updateExpense(id, updatedExpense);
      Navigator.pop(context);

      DelightToastBar(
        builder: (toastContext) => const ToastCard(
          title: Text('Update successful'),
          leading: Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
        ),
        autoDismiss: true,
        snackbarDuration: Durations.extralong4,
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Back"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2),
          child: Container(
            height: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            children: [
              Text(
                widget.mode == Mode.create ? "New Expense" : "Edit Expense",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: TextFormField(
                    initialValue: amount.toString(),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    textAlign: TextAlign.center,
                    validator: validateQuantity,
                    decoration: const InputDecoration(
                      prefix: Text("\$ "),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "0",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      amount = double.tryParse(value) ?? 0;
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: TextFormField(
                  initialValue: title,
                  onChanged: (value) {
                    title = value;
                  },
                  validator: validateTitle,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.notes_rounded),
                    hintText: "Title ",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(2, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Category>(
                    value: selectedCategory,
                    isExpanded: true,
                    items: Category.values.map((category) {
                      return DropdownMenuItem<Category>(
                        value: category,
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(category.image),
                            ),
                            const SizedBox(width: 20),
                            Text(category.name),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: TextFormField(
                  controller: _dateController,
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select the date ';
                    }
                    return null;
                  },
                  onTap: () async {
                    DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );

                    if (newDate != null) {
                      setState(() {
                        _dateController.text =
                            DateFormat('dd/MM/yyyy').format(newDate);
                        date = newDate;
                      });
                    }
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.date_range),
                    hintText: "Select Date",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: () {
                    final newExpense = Expense(
                      title: title,
                      amount: amount,
                      date: date,
                      category: selectedCategory,
                    );
                    widget.mode == Mode.create
                        ? addExpense(newExpense)
                        : updatedExpense(widget.expense!.expenseId, newExpense);
                  },
                  child: Text(
                    widget.mode == Mode.create ? "Save" : "Update",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
