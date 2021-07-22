import './transaction_item.dart';
import 'package:flutter/cupertino.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(String) removeItem;

  const TransactionList(this.transactions, this.removeItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(
                children: [
                  Text(
                    "No transaction added yet!",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      height: constraints.maxHeight * 0.7,
                      child: Image.asset('assets/images/waiting.png')),
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionItem(
                  transaction: transactions[index],
                  removeItem: removeItem,
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
