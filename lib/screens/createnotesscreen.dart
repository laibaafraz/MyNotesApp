import 'package:flutter/material.dart';
import 'package:notesapp/models/notes.dart';
import 'package:notesapp/screens/homescreen.dart';

class Createnotescreen extends StatefulWidget {
  final  Note? existingNotes;
  const Createnotescreen({super.key, this.existingNotes});

  @override
  State<Createnotescreen> createState() => _CreatenotescreenState();
 
}

class _CreatenotescreenState extends State<Createnotescreen> {
  
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController contentcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    titlecontroller.text = widget.existingNotes?.title ?? '';
    contentcontroller.text = widget.existingNotes?.content ?? '';
  }
  @override
  void dispose() {
    titlecontroller.dispose();      
    contentcontroller.dispose();
    super.dispose();
  }

   void saveNote() {
    final title = titlecontroller.text.trim();
    final content = contentcontroller.text.trim();

    if (title.isEmpty && content.isEmpty) {
      Navigator.pop(context);
      return;
    }
    Navigator.pop(context, Note(title: title, content: content));
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.existingNotes == null ? "New Note" : "Edit Note",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.5,
            color: Color(0xFF212121),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
              SizedBox(height: 80,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                   controller: titlecontroller,
                   style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.w700,
                     letterSpacing: 0.3,
                     color: Color(0xFF212121),
                   ),
                   decoration: InputDecoration(
                    label: Text(
                      "Title",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                   controller: contentcontroller,
                   maxLines: 6,
                   style: TextStyle(
                     fontSize: 16,
                     height: 1.5,
                     color: Color(0xFF212121),
                   ),
                   decoration: InputDecoration(
                    label: Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            SizedBox(height: 30,),
            Center(
              child: InkWell(
                onTap: () {
                  saveNote();
                },
                child: Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Colors.amber,
                  ),
                  child: Center(child: Text("Save",style: TextStyle(fontStyle: FontStyle.italic,fontSize:22,fontWeight:  FontWeight.w800,letterSpacing: 1.5,color: Color(0xFF212121)))),
                ),
              ),
            ),
        ],
      ),
    );
  }
}