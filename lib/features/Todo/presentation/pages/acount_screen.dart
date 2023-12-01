import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:valknut_todo/features/Todo/presentation/pages/add_account.dart';
import 'package:valknut_todo/features/Todo/presentation/pages/todo_sreen.dart';
import 'package:valknut_todo/features/Todo/presentation/widgets/pick_image.dart';

class AcountScreen extends StatefulWidget {
  final String firstName;
  final String lastName;
  final Uint8List? image;
  const AcountScreen(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.image});

  @override
  State<AcountScreen> createState() =>
      _AcountScreenState(firstName, lastName, image);
}

class _AcountScreenState extends State<AcountScreen> {
  String firstName;
  String lastName;
  Uint8List? image;
  _AcountScreenState(this.firstName, this.lastName, this.image);
  @override
  void initState() {
    firstName;
    lastName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: PickImage(image: image),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'FirstName:',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            padding: const EdgeInsets.only(left: 20, top: 10),
            width: MediaQuery.of(context).size.width,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(203, 92, 89, 89),
            ),
            child: Text(
              firstName,
              style: const TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'LastName:',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            padding: const EdgeInsets.only(left: 20, top: 10),
            width: MediaQuery.of(context).size.width,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(203, 92, 89, 89),
            ),
            child: Text(
              lastName,
              style: const TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }

//the app bar thing
  AppBar _appBar() {
    return AppBar(
      toolbarHeight: 75,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      backgroundColor: const Color.fromARGB(146, 45, 44, 44),
      title: const Center(
        child: Text(
          'Acount',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
      ),
      leading: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const TodoScreen(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Image.asset(
            'assets/images/previous.png',
          ),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: InkWell(
            onTap: () {
              _scrollPage();
            },
            child: Image.asset(
              'assets/images/plus.png',
              width: 35,
              height: 35,
            ),
          ),
        ),
      ],
    );
  }

//the function to scroll from the app
  void _scrollPage() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => const SizedBox(
        height: 500,
        child: AddAccount(),
      ),
    );
  }
}
