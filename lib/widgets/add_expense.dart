import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  final Function(String, double, DateTime) onAdd;

  const AddExpense({super.key, required this.onAdd});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;

  // pick date
  void pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // submit data
  void submit() {
    final title = titleController.text;
    final amount = double.tryParse(amountController.text);

    if (title.isEmpty || amount == null || selectedDate == null) {
      return;
    }

    widget.onAdd(title, amount, selectedDate!);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: "Title"),
          ),
          TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Amount"),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                selectedDate == null
                    ? "No date chosen"
                    : selectedDate.toString().split(' ')[0],
              ),
              TextButton(
                onPressed: pickDate,
                child: const Text("Choose Date"),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: submit,
            child: const Text("Add Expense"),
          ),
        ],
      ),
    );
  }
}
