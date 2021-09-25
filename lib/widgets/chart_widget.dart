import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:expenses/widgets/chart_bar_widget.dart';

import 'package:expenses/models/transaction.dart';

class ChartWidget extends StatelessWidget {
  final List<Transaction> recentTransaction;

  const ChartWidget({Key? key, required this.recentTransaction})
      : super(key: key);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      final initialsWeekDay = DateFormat.E().format(weekDay)[0];

      double totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        bool sameDay = recentTransaction[i].date.day == weekDay.day;
        bool sameMonth = recentTransaction[i].date.month == weekDay.month;
        bool sameYear = recentTransaction[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransaction[i].value;
        }
      }

      return {'day': initialsWeekDay, 'value': totalSum};
    });
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, tr) {
      return sum + (tr['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: groupedTransactions.map((tr) {
          return ChartBarWidget(
            label: tr['day'].toString(),
            value: tr['value'] as double,
            percentage: (tr['value'] as double) / _weekTotalValue,
          );
        }).toList(),
      ),
    );
  }
}
