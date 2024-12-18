import '../../core/utils/db_helper.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final DBHelper dbHelper;

  TransactionRepositoryImpl(this.dbHelper);

  @override
  Future<void> addTransaction(TransactionEntity transaction) async {
  
     
      await  dbHelper.insertTransaction({
      'type': transaction.type,
      'category': transaction.category,
      'amount': transaction.amount,
    });
  }

  @override
  Future<List<TransactionEntity>> fetchTransactions() async {
    final data = await dbHelper.fetchTransactions();
    return data.map((e) => TransactionEntity(
          type: e['type'],
          category: e['category'],
          amount: e['amount'],
        )).toList();
  }

  @override
  Future<void> clearTransactions() async {
    await dbHelper.clearTransactions();
  }
}
