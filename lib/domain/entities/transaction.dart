class TransactionEntity {
  final int? id; 
  final String type;
  final String category;
  final double amount;

  TransactionEntity({
    this.id, 
    required this.type,
    required this.category,
    required this.amount,
  });

 

}
