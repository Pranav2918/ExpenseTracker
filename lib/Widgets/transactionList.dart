import 'package:expensetracker/Models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  Center(
                    child: Text(
                      'Your transaction list is empty !',
                      style:
                          TextStyle(fontSize: 22, fontFamily: "Vanio-Regular"),
                    ),
                  ),
                  SizedBox(height: 10),
                  Image.asset('assets/images/paper.png', fit: BoxFit.cover)
                ])
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    trailing: IconButton(
                      onPressed: () =>
                          deleteTransaction(transactions[index].id),
                      icon: Icon(Icons.delete,
                          color: Color.fromRGBO(255, 0, 21, 0.9)),
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                            child: Text(
                          'Rs.${transactions[index].amount}',
                          style: TextStyle(fontFamily: "Vanio"),
                        )),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: TextStyle(fontFamily: "Vanio"),
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                        style: TextStyle(fontFamily: "Vanio-Regular")),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
