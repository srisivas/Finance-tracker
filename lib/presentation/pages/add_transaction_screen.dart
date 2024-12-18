import 'package:Expanses/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/transaction.dart';
import '../../domain/usecases/finance_tracker_viewmodel.dart';
import '../components/dropdown_field.dart';
import '../components/tab_selector.dart';
import '../components/text_field.dart';


class AddTransactionScreen extends StatefulWidget {
  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();

  String _transactionType = 'Income';
  String _selectedCategory = 'Salary';

  final List<String> _incomeCategories = ['Salary', 'Bonus', 'Investment'];
  final List<String> _expenseCategories = ['Rent', 'Groceries', 'Utilities', 'Food'];

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FinanceTrackerViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Transaction'),
        backgroundColor: AppColors.incomeColor, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
             
              TabSelector(
                selectedTab: _transactionType,
                onTabChanged: (type) {
                  setState(() {
                    _transactionType = type;
                    _selectedCategory = (_transactionType == 'Income'
                        ? _incomeCategories
                        : _expenseCategories)
                        .first;
                  });
                },
                tabs: ['Income', 'Expense'],
              ),
              SizedBox(height: 16),

        
              DropdownField(
                value: _selectedCategory,
                label: 'Category',
                items: (_transactionType == 'Income'
                        ? _incomeCategories
                        : _expenseCategories),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
              ),
              SizedBox(height: 16),

           
              CustomTextField(
                controller: _amountController,
                label: 'Amount',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  if (double.tryParse(value) == null ||
                      double.parse(value) <= 0) {
                    return 'Enter a valid positive number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.incomeColor, 
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newTransaction = TransactionEntity(
                      type: _transactionType,
                      category: _selectedCategory,
                      amount: double.parse(_amountController.text),
                    );

                    viewModel.addTransaction(newTransaction);
                    Navigator.of(context).pop();
                  }
                },
                child: Text(
                  'Add Transaction',
                  style: TextStyle(fontSize: 18, color: AppColors.selectedTabTextColor), // Global color for text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
