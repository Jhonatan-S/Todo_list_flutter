import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoListItens extends StatelessWidget {
   ToDoListItens({super.key, required this.title, required this.dateTime});

  final String title;
  final dateTime;


  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Slidable(
        endActionPane: const ActionPane(
          motion: ScrollMotion(),
          children: [
             SizedBox(width: 20),
            SlidableAction(onPressed: null, 
              
              flex: 2,    
              backgroundColor: Color.fromARGB(255, 255, 0, 0),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Deletar',
            )
          ],
        ),


        child: Container(
          decoration: BoxDecoration(
            color: Colors.lightGreen[100],
            borderRadius: BorderRadius.circular(3),
          ),
          child: Column(
            children: [
              ListTile(
                title: Text(title),
                subtitle: Text('$dateTime'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
