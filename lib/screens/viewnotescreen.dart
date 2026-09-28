import 'package:flutter/material.dart';
import 'package:notesapp/models/notes.dart';
import 'package:notesapp/screens/createnotesscreen.dart';

class ViewNoteScreen extends StatelessWidget {
  final Note note;

  const ViewNoteScreen({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.5,
            color: Color(0xFF212121),
          ),
        ),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Color(0xFF212121)),
            onPressed: () async {
              final updatedNote = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Createnotescreen(existingNotes: note),
                ),
              );
              if (updatedNote != null && context.mounted) {
                Navigator.pop(context, updatedNote);
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title.isEmpty ? "(No title)" : note.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
                height: 1.3,
                color: Color(0xFF212121),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              note.content,
              style: TextStyle(
                fontSize: 17,
                height: 1.6,
                letterSpacing: 0.2,
                color: Colors.grey.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}