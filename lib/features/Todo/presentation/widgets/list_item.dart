import 'package:flutter/material.dart';
import 'package:valknut_todo/features/Todo/data/data_sources/todo_data.dart';

class ListItem extends StatelessWidget {
  final TodoData todoText;
  final deleteTodo;
  final checkTodo;
  const ListItem(
      {super.key,
      required this.todoText,
      required this.deleteTodo,
      required this.checkTodo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: ListTile(
        leading: IconButton(
          onPressed: () {
            checkTodo(todoText);
          },
          icon: todoText.done
              ? const Icon(
                  Icons.check_box,
                  color: Colors.black,
                )
              : const Icon(
                  Icons.check_box_outline_blank_outlined,
                  color: Colors.black,
                ),
        ),
        title: Text(
          todoText.text!,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            decoration: todoText.done ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: InkWell(
          onTap: () {
            deleteTodo(todoText.id!);
          },
          child: Image.asset(
            'assets/images/trash.png',
            width: 45,
            height: 45,
          ),
        ),
      ),
    );
  }
}
