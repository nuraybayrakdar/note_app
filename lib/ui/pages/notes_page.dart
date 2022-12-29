import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_app/model/note.dart';
import 'package:note_app/repository/notes_db.dart';
import 'package:note_app/ui/pages/add_note_page.dart';
import 'package:note_app/ui/pages/homepage.dart';
import 'package:note_app/ui/pages/note_detail_page.dart';
import 'package:note_app/ui/widgets/noteCard.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      refreshNotes();
    });
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);
    notes = await NotesDatabase.instance.readAllNotes();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        backgroundColor: const Color.fromARGB(255, 3, 102, 53),
        title: const Text(
          "My Notes",
          style: TextStyle(
              fontFamily: 'RobotoMono',
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        actions: const [
          Icon(Icons.search),
          SizedBox(
            width: 12,
          )
        ],
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator(
                color: Color.fromARGB(231, 3, 161, 83),
              )
            : notes.isEmpty
                ? const Text(
                    'No Notes!',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'RobotoMono'),
                  )
                : buildNotes(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(231, 3, 161, 83),
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: ((context) => const AddNotePage())),
          );
        },
      ),
    );
  }

  Widget buildNotes() => StaggeredGridView.countBuilder(
        padding: const EdgeInsets.all(8),
        itemCount: notes.length,
        staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          final note = notes[index];

          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NoteDetailPage(noteId: note.id!),
              ));

              refreshNotes();
            },
            child: NoteCardWidget(note: note, index: index),
          );
        },
      );
}
