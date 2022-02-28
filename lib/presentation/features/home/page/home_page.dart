import 'package:flutter/material.dart';
import 'package:todo_win/presentation/shared/widgets/scaffold/scaffold_primary.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPrimary(
      title: 'Home',
      child: Container(),
    );
  }
}
