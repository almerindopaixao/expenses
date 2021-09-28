import 'package:flutter/material.dart';

import 'package:expenses/layout/adaptative_text_field.dart';
import 'package:expenses/layout/adaptative_button.dart';
import 'package:expenses/layout/adaptative_date_picker.dart';

class TransactionFormWidget extends StatefulWidget {
  final void Function({
    required String title,
    required double value,
    required DateTime date,
  }) onSubmit;

  TransactionFormWidget({
    Key? key,
    required this.onSubmit,
  }) : super(key: key) {
    print('Constructor TransactionFormWidget');
  }

  @override
  State<TransactionFormWidget> createState() {
    print('CreateState TransactionFormWidget');
    return _TransactionFormWidgetState();
  }
}

class _TransactionFormWidgetState extends State<TransactionFormWidget> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _TransactionFormWidgetState() {
    print('Constructor TransactionFormWidget');
  }

  @override
  void initState() {
    super.initState();

    print('initState _TransactionFormWidgetState');
  }

  @override
  void didUpdateWidget(covariant TransactionFormWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget _TransactionFormWidgetState');
  }

  @override
  void dispose() {
    super.dispose();

    print('dispose _TransactionFormWidgetState');
  }

  void _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) return;

    widget.onSubmit(title: title, value: value, date: _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
              top: 0,
              right: 10,
              left: 10,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: <Widget>[
              AdaptativeTextField(
                label: 'Título',
                controller: _titleController,
                onSubmitted: (_) => _submitForm(),
              ),
              AdaptativeTextField(
                label: 'Valor (R\$)',
                controller: _valueController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(),
              ),
              AdaptativeDatePicker(
                selectedDate: _selectedDate,
                onDateChange: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AdaptativeButton(
                    label: 'Nova Transação',
                    onPressed: _submitForm,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
