import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:valknut_todo/features/Todo/data/data_sources/todo_data.dart';
import 'package:valknut_todo/features/Todo/presentation/pages/acount_screen.dart';
import 'package:valknut_todo/features/Todo/presentation/widgets/list_item.dart';
import 'package:valknut_todo/features/Todo/presentation/widgets/task_list.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<TodoData> _foundData = [];
  final todosList = TodoData.todoList();
  final controllerAdd = TextEditingController();
  final controllerSearch = TextEditingController();
  @override
  void initState() {
    _foundData = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Uint8List? image;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Task',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 10, 91, 50)),
                ),
                TaskList(
                  foundData: _foundData,
                  image: 'assets/images/all.png',
                  title: 'All',
                ),
                TaskList(
                  foundData: _foundData,
                  image: 'assets/images/check-mark.png',
                  title: 'Checked  ${_foundData.length}',
                ),
                TaskList(
                  foundData: _foundData,
                  image: 'assets/images/stop.png',
                  title: 'Unchecked',
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Professional',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 10, 91, 50)),
                ),
                TaskList(
                  foundData: _foundData,
                  image: 'assets/images/freelance.png',
                  title: 'Work',
                ),
                TaskList(
                  foundData: _foundData,
                  image: 'assets/images/dumbbell.png',
                  title: 'Gym',
                ),
                TaskList(
                  foundData: _foundData,
                  image: 'assets/images/book.png',
                  title: 'Studies',
                ),
                TaskList(
                  foundData: _foundData,
                  image: 'assets/images/capsules.png',
                  title: 'Medical',
                ),
              ],
            )
          ],
        ),
      ),
      appBar: _appBar(image),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
            child: Column(
              children: [
                //thesearchbar
                searchBar(),
                const SizedBox(
                  height: 30,
                ),

                Expanded(
                  child: ListView(
                    children: [
                      const Center(
                        child: Text(
                          'Todo List',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      for (TodoData toddo in _foundData.reversed)
                        ListItem(
                          todoText: toddo,
                          deleteTodo: _deleteTodo,
                          checkTodo: _checkTodo,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: TextFormField(
                        controller: controllerAdd,
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 115, 113, 113)),
                          contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          hintText: 'Enter the todo',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
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
                      color: const Color.fromARGB(255, 2, 62, 4),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: InkWell(
                      onTap: () {
                        _addTodoList(controllerAdd.text);
                      },
                      child: Image.asset(
                        'assets/images/add.png',
                        width: 60,
                        height: 60,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  //to add todo to the item
  void _addTodoList(String todo) {
    setState(
      () {
        todosList.add(
          TodoData(id: DateTime.now().toString(), text: todo),
        );
        controllerAdd.clear();
      },
    );
  }

  //the function to delete the todo
  void _deleteTodo(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  //the function for the checkbox thing
  void _checkTodo(TodoData todo) {
    setState(() {
      todo.done = !todo.done;
    });
  }

  //for the search bar
  void _runFilter(String enteredKeyword) {
    List<TodoData> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where(
            (item) => item.text!.toLowerCase().contains(
                  enteredKeyword.toLowerCase(),
                ),
          )
          .toList();
    }
    setState(() {
      _foundData = results;
    });
  }

  //the search bar thing
  Widget searchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextFormField(
        onTap: () {
          _runFilter(controllerSearch.text);
        },
        controller: controllerSearch,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          hintText: 'Search',
          hintStyle: const TextStyle(color: Color.fromARGB(255, 115, 113, 113)),
          prefixIcon: Image.asset(
            'assets/images/search.png',
            width: 10,
            height: 10,
          ),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
        autocorrect: true,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
      ),
    );
  }

  //the app bar thing
  AppBar _appBar(Uint8List? image) {
    return AppBar(
      toolbarHeight: 75,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      backgroundColor: const Color.fromARGB(146, 45, 44, 44),
      title: const Text(
        'Valknut todo',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevation: 0,
      centerTitle: true,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: InkWell(
            //to navigate to the user account
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AcountScreen(
                    firstName: '',
                    lastName: '',
                    image: image,
                  ),
                ),
              );
            },
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              'assets/images/valknut.png',
            ),
          ),
        ),
      ],
      leading: Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.only(left: 20),
          child: InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Image.asset(
              'assets/images/list.png',
              width: 10,
              height: 10,
            ),
          ),
        ),
      ),
    );
  }
}
