import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:core';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _submitData() {
    final enteredAmount = double.parse(amountController.text);
    final enteredTitle = titleController.text;

    if (enteredAmount <= 0 || enteredTitle.isEmpty) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              onSubmitted: (_) => _submitData,
              decoration: InputDecoration(labelText: 'Enter Title'),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData,
              decoration: InputDecoration(labelText: 'Enter Amount'),
            ),
            Align(
              alignment: Alignment.topRight,
              child: RaisedButton(
                color: Colors.teal,
                onPressed: _submitData,
                child: Text(
                  'Add Transaction',
                  style: TextStyle(
                      fontFamily: "Vanio-Regular", color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
