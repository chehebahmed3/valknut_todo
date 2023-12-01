import 'package:flutter/material.dart';
import 'package:valknut_todo/features/Todo/data/data_sources/todo_data.dart';

class TaskList extends StatelessWidget {
  final List<TodoData> foundData;
  final String image;
  final String title;
  const TaskList(
      {super.key,
      required this.foundData,
      required this.image,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 05),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {},
            child: Image.asset(
              image,
              width: 50,
              height: 50,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
