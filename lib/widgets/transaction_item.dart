import 'dart:math';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:expenses/models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required this.tr,
    required this.onRemove,
  }) : super(key: key);

  final Transaction tr;
  final void Function({required String id}) onRemove;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  static const  colors = [
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.blue,
    Colors.black,
  ];

  late Color _backgroundColor;

  @override
  void initState() {
    super.initState();
    int i = Random().nextInt(5);
    _backgroundColor = colors[i];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          // backgroundColor: Theme.of(context).colorScheme.primary,
          backgroundColor: _backgroundColor,
          foregroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                'R\$${widget.tr.value}',
              ),
            ),
          ),
        ),
        title: Text(
          widget.tr.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(widget.tr.date),
        ),
        trailing: MediaQuery.of(context).size.width > 480
            ? TextButton.icon(
                onPressed: () => widget.onRemove(id: widget.tr.id),
                icon: const Icon(Icons.delete),
                label: const Text('Excluir'),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).errorColor,
                  ),
                ),
              )
            : IconButton(
                onPressed: () => widget.onRemove(id: widget.tr.id),
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
