import 'package:flutter/material.dart';
import 'package:todo_win/presentation/shared/widgets/header/base_header.dart';

class HeaderCollection extends StatelessWidget {
  const HeaderCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseHeader(
      children: [
        TextSpan(
          text: 'Selecione abaixo a',
        ),
        TextSpan(
          text: '\nlista de tarefa',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
        TextSpan(
          text: ' desejada.',
        ),
      ],
    );
  }
}
