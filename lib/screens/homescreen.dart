import 'package:flutter/material.dart';
import 'package:notesapp/screens/createnotesscreen.dart';
import 'package:notesapp/models/notes.dart';
import 'package:notesapp/screens/viewnotescreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Note> notes = [];  

  void addNote() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Createnotescreen()),
    );
    if (result != null && result is Note) {
      setState(() {
        notes.add(result);
      });
    }
  }
  void editNote(int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Createnotescreen(existingNotes :notes[index])),
    );

    if (result != null && result is Note) {
      setState(() {
        notes[index] = result;
      });
    }
  }

  void deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notes",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.5,
            color: Color(0xFF212121),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: notes.isEmpty  ? const Center(
        child: Text(
          "No notes yet. Tap + to add one!",
          style: TextStyle(
            fontSize: 18,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
            color: Colors.grey,
          ),
        ),
      ): 
      ListView.builder(
        itemCount: notes.length,
        itemBuilder:(context, index){
           final note = notes[index];
          return  ListTile(
                    title: Text(
                      note.title.isEmpty ? "(No title)" : note.title,
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.3,
                        color: Color(0xFF212121),
                      ),
                    ),
                    subtitle: Text(
                      note.content,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    trailing: IconButton(onPressed: () => deleteNote(index), icon: Icon(Icons.delete, color:  Colors.red)),
                    onTap: () async {
              final updatedNote = await Navigator.push(
                   context,
    MaterialPageRoute(builder: (context) => ViewNoteScreen(note: notes[index])),
  );

  if (updatedNote != null && updatedNote is Note) {
    setState(() {
      notes[index] = updatedNote;
    });
  }
},
             
          );
        }),
  
  floatingActionButton: FloatingActionButton(
  onPressed: addNote,
  child: const Icon(Icons.create , color: Colors.amber,),
),

    );
  }
}