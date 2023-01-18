import 'package:flutter/material.dart';
import 'package:realapp/widgets/new_transaction.dart';
import 'package:realapp/widgets/transaction_list.dart';
import 'package:realapp/widgets/user_transactions.dart';
//import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  //late String titleInput;
  // late String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.brown,
                child: Text('Chart'),
                elevation: 5,
              ),
            ),
            //this is the input AREA
            UserTransactions()
            //removed
          ],
        ),
      ),
    );
  }
}
