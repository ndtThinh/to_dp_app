import 'package:flutter/material.dart';
import 'package:to_dp_app/sqlite/note_model.dart';
import 'package:to_dp_app/sqlite/sqlite.dart';

class CreateNoteLayout extends StatefulWidget {
  const CreateNoteLayout({super.key});

  @override
  State<CreateNoteLayout> createState() => _CreateNoteLayoutState();
}

class _CreateNoteLayoutState extends State<CreateNoteLayout> {
  final title = TextEditingController();
  final content = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                //back
                Navigator.of(context).pop(false);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          IconButton(
              onPressed: () {
                //create note
                db
                    .createNote(NoteModel(
                        noteTitle: title.text,
                        noteContent: content.text,
                        createAt: DateTime.now().timeZoneName.toString()))
                    .whenComplete(() => Navigator.of(context).pop(true));
              },
              icon: const Icon(Icons.check))
        ],
        title: const Text('Create note page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: title,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Tiltle is require';
                  }
                },
                decoration: const InputDecoration(
                  label: Text('Title'),
                ),
              ),
              TextFormField(
                controller: content,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Content is require';
                  }
                },
                decoration: const InputDecoration(
                  label: Text('Content'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
