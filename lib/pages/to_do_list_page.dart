import 'package:flutter/material.dart';
import 'package:to_do_list/models/todo.dart';
import 'package:to_do_list/widgets/to_do_list.dart';

class ToDoListPage extends StatefulWidget {
  ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

List<Todo> toDos = [];

final TextEditingController inputTextController = TextEditingController();
int tarefaPendente = 0;

class _ToDoListPageState extends State<ToDoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Center(
          child: Text(
            'Lista de Tarefa',
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: inputTextController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adicione uma tarefa',
                        hintText: 'Ex: Estudar flutter',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  TextButton(
                    onPressed: () {
                      String text = inputTextController.text;

                      if (inputTextController.text.isNotEmpty) {
                        inputTextController.clear();
                        setState(() {
                          toDos.add(
                             Todo(
                              title: text,
                              dateTime: DateTime.now(),
                            ),
                          );
                          tarefaPendente = toDos.length;
                        });
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      padding: const EdgeInsets.all(14),
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Flexible(
                child: ListView(shrinkWrap: true, children: [
                  for ( Todo todo in toDos)
                    ToDoListItens(
                      
                      todo: todo;

                    )
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Você possui $tarefaPendente tarefas pendentes',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        toDos.clear();
                        tarefaPendente = 0;
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text(
                      'Limpar tudo',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
