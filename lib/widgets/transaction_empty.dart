import 'package:flutter/material.dart';

import 'package:expenses/themes/app_images.dart';

class TransactionEmpty extends StatelessWidget {
  final BoxConstraints constraints;
  const TransactionEmpty({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          "Nenhuma transação cadastrada !",
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
            height: constraints.maxHeight * 0.6,
            child: Image.asset(
              AppImages.waiting,
              fit: BoxFit.cover,
            )),
      ],
    );
  }
}
