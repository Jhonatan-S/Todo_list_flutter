import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/commom/to_do_object.dart';

class ToDoListItens extends StatelessWidget {
  ToDoListItens(
      {super.key,
      required this.title,
      required this.dateTime,
      required Todo todo});

  final String title;
  final dateTime;

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
    );
  }
}
