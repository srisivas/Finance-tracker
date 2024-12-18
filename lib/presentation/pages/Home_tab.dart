import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/colors.dart';
import '../../domain/usecases/finance_tracker_viewmodel.dart';
import '../components/summary_card.dart';
import '../components/summary_grid.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FinanceTrackerViewModel>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
          SizedBox(height: 16),
          SummaryGrid(
            cards: [
              SummaryCard(
                title: "Total Balance",
                amount: "₹${viewModel.totalBalance.toStringAsFixed(2)}",
                icon: Icons.account_balance_wallet,
                color: AppColors.balanceColor.shade700,
              ),
              SummaryCard(
                title: "Total Income",
                amount: "₹${viewModel.totalIncome.toStringAsFixed(2)}",
                icon: Icons.arrow_drop_up_sharp,
                color: AppColors.incomeColor.shade700,
              ),
              SummaryCard(
                title: "Total Expenses",
                amount: "₹${viewModel.totalExpenses.toStringAsFixed(2)}",
                icon: Icons.arrow_drop_down_sharp,
                color: AppColors.expenseColor.shade700,
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
