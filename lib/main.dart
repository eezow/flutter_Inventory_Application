import 'package:flutter/material.dart';
import 'package:realapp/widgets/chart.dart';
import 'package:realapp/widgets/new_transaction.dart';
import 'package:realapp/widgets/transaction_list.dart';
//import 'package:realapp/widgets/user_transactions.dart';
import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        accentColor: Colors.brown,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        )),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //late String titleInput;
  //final titleController = TextEditingController();
  //final amountController = TextEditingController();

  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: 't1', title: 'New shoes', amount: 69.99, date: DateTime.now()),
    // Transaction(
    //     id: 't2',
    //     title: 'weekly groceries',
    //     amount: 16.53,
    //     date: DateTime.now())
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txtitle, double txamount, DateTime chosenDate) {
    final newTX = Transaction(
      id: DateTime.now().toString(),
      title: txtitle,
      amount: txamount,
      date: chosenDate,
    );

    setState(() {
      _userTransactions.add(newTX);
    });
  }

  void _startNewtransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  void deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
              onPressed: () => _startNewtransaction(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(recentTransaction: _recentTransactions),

            //this is the input AREA
            TransactionList(_userTransactions, deleteTransaction),
            //removed
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startNewtransaction(context),
      ),
    );
  }
}
