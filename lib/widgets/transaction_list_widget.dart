import 'package:flutter/material.dart';

import 'package:expenses/widgets/transaction_empty.dart';
import 'package:expenses/widgets/transaction_item.dart';

import '../models/transaction.dart';

class TransactionListWidget extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function({required String id}) onRemove;

  const TransactionListWidget({
    Key? key,
    required this.transactions,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return TransactionEmpty(
                constraints: constraints,
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return TransactionItem(
                key: GlobalObjectKey(tr),
                tr: tr,
                onRemove: onRemove,
              );
            },
          );
  }
}
