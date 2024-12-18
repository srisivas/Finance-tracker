import 'package:flutter/material.dart';

import '../entities/transaction.dart';
import '../repositories/transaction_repository.dart';

class FinanceTrackerViewModel extends ChangeNotifier {
  final TransactionRepository repository;

  double _totalIncome = 0.0;
  double _totalExpenses = 0.0;
  List<TransactionEntity> _transactions = [];

  FinanceTrackerViewModel(this.repository) {
    loadTransactions();
  }

  double get totalBalance => _totalIncome - _totalExpenses;

  // Add these getters for Total Income and Total Expenses
  double get totalIncome => _totalIncome;
  double get totalExpenses => _totalExpenses;

  List<TransactionEntity> get transactions => _transactions;

  Future<void> addTransaction(TransactionEntity transaction) async {
    await repository.addTransaction(transaction);
    await loadTransactions();
  }

  Future<void> loadTransactions() async {
    _transactions = await repository.fetchTransactions();

    // Calculate Total Income
    _totalIncome = _transactions
        .where((t) => t.type == 'Income')
        .fold(0.0, (sum, t) => sum + t.amount);

    // Calculate Total Expenses
    _totalExpenses = _transactions
        .where((t) => t.type == 'Expense')
        .fold(0.0, (sum, t) => sum + t.amount);

    notifyListeners();
  }
}
