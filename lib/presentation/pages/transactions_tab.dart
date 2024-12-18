import 'package:Expanses/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/usecases/finance_tracker_viewmodel.dart';


class TransactionsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FinanceTrackerViewModel>(context);

    return viewModel.transactions.isEmpty
        ? Center(
            child: Text(
              'No Transactions Available',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textColor,
              ),
            ),
          )
        : ListView.builder(
            itemCount: viewModel.transactions.length,
            itemBuilder: (context, index) {
              final transaction = viewModel.transactions[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                color: AppColors.cardBackground,
                elevation: 2,
                child: ListTile(
                  leading: Icon(
                    transaction.type == 'Income'
                        ? Icons.arrow_upward
                        : Icons.arrow_downward,
                    color: transaction.type == 'Income'
                        ? AppColors.incomeColor
                        : AppColors.expenseColor,
                  ),
                  title: Text(
                    transaction.category,
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    transaction.type,
                    style: TextStyle(
                      color: AppColors.textColor,
                    ),
                  ),
                  trailing: Text(
                    "₹${transaction.amount}",
                    style: TextStyle(
                      color: transaction.type == 'Income'
                          ? AppColors.incomeColor
                          : AppColors.expenseColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          );
  }
}
