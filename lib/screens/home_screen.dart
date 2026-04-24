import 'package:flutter/material.dart';
import '../models/expense.dart';
import '../widgets/expense_item.dart';
import '../widgets/add_expense.dart';

// main screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Expense> expenses = [];

  // add new expense
  void addExpense(String title, double amount, DateTime date) {
    final newExpense = Expense(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: date,
    );

    setState(() {
      expenses.add(newExpense);
    });
  }

  // delete expense
  void deleteExpense(String id) {
    setState(() {
      expenses.removeWhere((exp) => exp.id == id);
    });
  }

  // calculate total
  double get total {
    double sum = 0;
    for (var exp in expenses) {
      sum += exp.amount;
    }
    return sum;
  }

  // open bottom sheet
  void openAddExpense() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return AddExpense(onAdd: addExpense);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
      ),
      body: Column(
        children: [
          // total section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Text(
              "Total: \$${total.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 20),
            ),
          ),

          // list
          Expanded(
            child: expenses.isEmpty
                ? const Center(child: Text("No expenses yet"))
                : ListView.builder(
                    itemCount: expenses.length,
                    itemBuilder: (context, index) {
                      return ExpenseItem(
                        expense: expenses[index],
                        onDelete: deleteExpense,
                      );
                    },
                  ),
          ),
        ],
      ),

      // add button
      floatingActionButton: FloatingActionButton(
        onPressed: openAddExpense,
        child: const Icon(Icons.add),
      ),
    );
  }
}
