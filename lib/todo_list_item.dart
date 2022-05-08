import 'package:flutter/material.dart';
import 'package:todo/models/todo_models.dart';

// ignore: must_be_immutable
class TodoListItem extends StatelessWidget {
  TodoModel item;
  TodoListItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: true,
        onChanged: (value){
          debugPrint(value.toString());
        }),
        title: Text(item.description),
    );
  }
}