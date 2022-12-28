import 'package:flutter/material.dart';
import 'package:note_app/ui/pages/notes_page.dart';
import 'package:note_app/ui/pages/todolist.dart';
import 'package:note_app/ui/widgets/appbarContent.dart';
import 'package:note_app/ui/widgets/appbarPainter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomPaint(
            painter: AppbarPainter(),
            size: const Size(500, 195),
            child: const AppbarContent(),
          ),
          Column(
            children: [
              Container(
                width: 200,
                height: 100,
                margin: const EdgeInsets.only(bottom: 20, top: 100),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(231, 10, 148, 79),
                        ),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 93, 111, 83))))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotesPage()),
                      );
                    },
                    child: const Text(
                      'Notes',
                      style: TextStyle(
                          fontFamily: 'RobotoMono',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: 200,
                height: 100,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(233, 3, 102, 52),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 67, 60, 60))))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ToDoListPage()),
                      );
                    },
                    child: const Text(
                      'ToDo List',
                      style: TextStyle(
                          fontFamily: 'RobotoMono',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(231, 3, 161, 83),
          child: const Text(
            "i",
            style: TextStyle(fontFamily: "RobotoMono", fontSize: 18),
          ),
          onPressed: () {}),
    );
  }
}
