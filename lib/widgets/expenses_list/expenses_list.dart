import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index].id),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        background: Container(color: Colors.red),
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
