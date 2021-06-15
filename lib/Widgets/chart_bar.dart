import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendings;
  final double spendingPercents;

  ChartBar(this.label, this.spendings, this.spendingPercents);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 20,
          child: FittedBox(
              child: Text(
            'Rs.${spendings.toStringAsFixed(0)}',
            style: TextStyle(fontFamily: "Vanio-Regular"),
          )),
        ),
        SizedBox(height: 5),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(220, 220, 220, 1)),
              ),
              FractionallySizedBox(
                heightFactor: spendingPercents,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(fontFamily: "Vanio"),
        )
      ],
    );
  }
}
