import 'package:flutter/material.dart';
import 'package:todo/models/todo_models.dart';
import 'package:todo/title_widget.dart';
import 'package:todo/todo_list_item.dart';
import 'package:todo/toolbar_widget.dart';
import 'package:uuid/uuid.dart';

class TodoApp extends StatelessWidget {
  TodoApp({Key? key}) : super(key: key);
  final newTodoController = TextEditingController();
  final List<TodoModel>allTodos = [
    TodoModel(id: const Uuid().v4(), description: 'Spora Git'),
    TodoModel(id: const Uuid().v4(), description: 'Alışveriş Yap'),
    TodoModel(id: const Uuid().v4(), description: 'Ders Çalış')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        children: [
          const TitleWidget(),
          TextField(
            controller: newTodoController,
            decoration: const InputDecoration(labelText:'Neler Yapacaksın Bugün'),
            onSubmitted: (newTodo){
              debugPrint("şunu ekle $newTodo");
            },
          ),
          const SizedBox(height: 20,),
          const ToolbarWidget(),
          for (var i=0; i<allTodos.length; i++)
          Dismissible(key:ValueKey(allTodos[i].id),
          onDismissed: (_){

          },
          child: TodoListItem(item:allTodos[i],),),
        ],
      ),
    );
  }
}