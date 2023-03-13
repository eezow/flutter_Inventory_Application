//import 'dart:js_util';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionController;
  final Function deleteTx;
  TransactionList(this.transactionController, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactionController.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No Transactions added yet!',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'lib/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView(
            children: [
              ...transactionController
                  .map((tx) => TransactionItem(
                        key: UniqueKey(),
                        transaction: tx,
                        deleteTx: deleteTx,
                      ))
                  .toList()
            ],
          );
  }
}
