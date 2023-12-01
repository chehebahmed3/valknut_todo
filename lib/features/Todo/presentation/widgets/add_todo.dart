import 'package:flutter/material.dart';
import 'package:valknut_todo/features/Todo/data/data_sources/todo_data.dart';

class AddTodo extends StatefulWidget {
  final List<TodoData> todosList;
  final List<TodoData> foundData;
  const AddTodo({super.key, required this.todosList, required this.foundData});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white),
            child: TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Color.fromARGB(255, 115, 113, 113)),
                contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                hintText: 'Enter the todo',
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {
              _addTodoList(controller.text);
            },
            icon: const Icon(
              Icons.add,
              color: Colors.black,
              size: 35,
            ),
          ),
        )
      ],
    );
  }

  //to add todo to the item
  void _addTodoList(String todo) {
    setState(
      () {
        widget.todosList.add(
          TodoData(id: DateTime.now().toString(), text: todo),
        );
      },
    );
  }
}
