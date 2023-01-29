import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionController;
  final Function deleteTx;
  TransactionList(this.transactionController, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactionController.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No Transactions added yet!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'lib/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                // return Card(
                //   child: Row(
                //     children: <Widget>[
                //       Container(
                //         margin:
                //             EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                //         decoration: BoxDecoration(
                //             border: Border.all(color: Colors.brown, width: 2)),
                //         padding: EdgeInsets.all(10),
                //         child: Text(
                //           '\$ ${transactionController[index].amount.toStringAsFixed(2)}',
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               fontSize: 20,
                //               color: Colors.brown),
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           Text(
                //             transactionController[index].title,
                //             style: TextStyle(
                //                 fontSize: 16, fontWeight: FontWeight.bold),
                //           ),
                //           Text(
                //             DateFormat('yyyy-MM-dd')
                //                 .format(transactionController[index].date),
                //             style: TextStyle(color: Colors.grey),
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // );
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                            child: Text(
                                '\$${transactionController[index].amount}')),
                      ),
                    ),
                    title: Text(transactionController[index].title),
                    subtitle: Text(DateFormat.yMMMd()
                        .format(transactionController[index].date)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () =>
                          deleteTx(transactionController[index].id),
                    ),
                  ),
                );
              },
              itemCount: transactionController.length,
            ),
    );
  }
}
