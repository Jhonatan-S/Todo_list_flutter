
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:todo/commom/colors.dart';
import 'package:todo/commom/to_do_object.dart';
import 'package:todo/widgets/list_view_tasks.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Todo> todos = [];
int todosLength = todos.length;



class _HomePageState extends State<HomePage> {
  final TextEditingController inputText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Lista de tarefa',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: inputText,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          focusColor: MyColors.mainColor,
                          labelText: 'Digite algo',
                          labelStyle: TextStyle(color: MyColors.mainColorDark),
                          hintText: 'Ex: Estudar Flutter',
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    TextButton(
                      onPressed: addTask,
                      style: TextButton.styleFrom(
                        backgroundColor: MyColors.mainColor,
                        padding: const EdgeInsets.all(13),
                      ),
                      child: const Icon(Icons.add,
                          size: 30, color: MyColors.whiteColor),
                    ),
                  ],
                ),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (Todo todo in todos)
                        Tasks(
                          todo: todo,
                          onDelete: onDelete,
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        todosLength <= 1
                            ? 'Você possui $todosLength tarefa pendente'
                            : 'Você possui $todosLength tarefas pendentes',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(
                            () {
                              todos.clear();
                              todosLength = todos.length;
                            },
                          );
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: MyColors.deleteColor),
                        child: const Column(
                          children: [
                            Text(
                              'Apagar tudo',
                              style: TextStyle(
                                color: MyColors.whiteColor,
                              ),
                            ),
                            Icon(
                              Icons.delete,
                              color: MyColors.whiteColor,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addTask() {
    if (inputText.text.isNotEmpty) {
      setState(
        () {
          todos.add(
            Todo(
              title: inputText.text.toString(),
              dateTime: DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now()),
            ),
          );
          todosLength = todos.length;
        },
      );
    }
    inputText.clear();
  }

  void onDelete(Todo todo) {
    setState(
      () {
        todos.remove(todo);
      },
    );
  }
}
