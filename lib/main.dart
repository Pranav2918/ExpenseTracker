import 'package:expensetracker/Models/transaction.dart';
import 'package:expensetracker/Widgets/chart.dart';
import 'package:expensetracker/Widgets/new_transaction.dart';
import 'package:expensetracker/Widgets/transactionList.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      title: 'Expense Tracker',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(id: 't1', title: 'Buds', amount: 160.50, date: DateTime.now()),
    // Transaction(
    //     id: 't2', title: 'Grocery', amount: 150.60, date: DateTime.now())
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

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void startAddNewTransactions(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: NewTransaction(_addNewTransaction));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => startAddNewTransactions(context),
              icon: Icon(Icons.add))
        ],
        title: Text(
          'Expense Tracker',
          style: TextStyle(fontFamily: "Happy"),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Chart(_recentTransactions),
            TransactionList(_userTransactions,_deleteTransaction)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(255, 0, 21, 0.9),
          onPressed: () {
            startAddNewTransactions(context);
          },
          child: Icon(Icons.add)),
    );
  }
}
