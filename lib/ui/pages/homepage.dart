import 'package:flutter/material.dart';
import 'package:note_app/ui/pages/notes_page.dart';
import 'package:note_app/ui/pages/todolist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 35, 33, 33),
        title: const Center(
          child: Text(
            'Planlamaya Başla !',
            style: TextStyle(
                fontFamily: 'RobotoMono',
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 200,
                height: 100,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 35, 33, 33)),
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 200,
                height: 100,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 35, 33, 33)),
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
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 35, 33, 33),
          child: const Text(
            "i",
            style: TextStyle(fontFamily: "RobotoMono", fontSize: 18),
          ),
          onPressed: () {}),
    );
  }
}
