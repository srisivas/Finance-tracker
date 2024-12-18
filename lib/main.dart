import 'package:Expanses/presentation/pages/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/utils/db_helper.dart';
import 'data/repositories/transaction_repository_impl.dart';
import 'domain/usecases/finance_tracker_viewmodel.dart';

void main() {
  final repository = TransactionRepositoryImpl(DBHelper.instance);

  runApp(
    ChangeNotifierProvider(
      create: (_) => FinanceTrackerViewModel(repository),
      child: MaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
