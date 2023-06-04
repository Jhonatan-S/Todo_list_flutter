import 'package:flutter/material.dart';
import 'package:todo/commom/colors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../commom/to_do_object.dart';

class Tasks extends StatelessWidget {
  Tasks({super.key, required this.todo, required this.onDelete});

  final Function(Todo) onDelete;
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            // A SlidableAction can have an icon and/or a label.
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                onPressed: () {
                  onDelete(todo);
                },
                style: TextButton.styleFrom(
                  backgroundColor: MyColors.deleteColor,
                  padding: EdgeInsets.all(25),
                ),
                child: const Text(
                  'Deletar',
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: MyColors.whiteColor),
                ),
              ),
            ),
          ],
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: MyColors.mostLightGreen,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    todo.title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    todo.dateTime,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
