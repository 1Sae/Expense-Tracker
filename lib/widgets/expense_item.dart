import 'package:flutter/material.dart';
import '../models/expense.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;
  final Function(String) onDelete;

  const ExpenseItem({
    super.key,
    required this.expense,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(expense.title),
        subtitle: Text(expense.date.toString().split(' ')[0]),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("\$${expense.amount}"),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => onDelete(expense.id),
            ),
          ],
        ),
      ),
    );
  }
}
