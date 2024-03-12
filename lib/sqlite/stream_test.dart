import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_dp_app/sqlite/create_note.dart';
import 'package:to_dp_app/sqlite/note_model.dart';
import 'package:to_dp_app/sqlite/sqlite.dart';

// ignore: must_be_immutable
class LayoutNotePage extends StatefulWidget {
  LayoutNotePage({super.key});

  @override
  State<LayoutNotePage> createState() => _LayoutNotePageState();
}

class _LayoutNotePageState extends State<LayoutNotePage> {
  final title = TextEditingController();
  final content = TextEditingController();
  late DatabaseHelper handler;
  late Future<List<NoteModel>> notes;
  final db = DatabaseHelper();

  @override
  void initState() {
    handler = DatabaseHelper();
    notes = handler.getAllNote();

    handler.initDB().whenComplete(() {
      notes = getAllNotes();
    });
    super.initState();
  }

  Future<List<NoteModel>> getAllNotes() {
    return handler.getAllNote();
  }

  Future<void> _repfresh() async {
    setState(() {
      notes = getAllNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const CreateNoteLayout()))
              .then((value) {
            if (value) {
              _repfresh();
            } else {}
          });
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Notes'),
      ),
      body: FutureBuilder(
          future: notes,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.isEmpty) {
              return const Center(child: Text('nodata'));
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          setState(() {
                            title.text = snapshot.data![index].noteTitle;
                            content.text = snapshot.data![index].noteContent;
                          });

                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              db
                                                  .updateNote(
                                                      snapshot
                                                          .data![index].noteId!,
                                                      title.text,
                                                      content.text)
                                                  .whenComplete(() {
                                                _repfresh();
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: const Text('Update')),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Cancel')),
                                      ],
                                    )
                                  ],
                                  title: const Text("Detail note"),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
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
                                );
                              });
                        },
                        leading: Text(snapshot.data![index].noteId.toString()),
                        title: Text(snapshot.data![index].noteTitle),
                        subtitle: Text(snapshot.data![index].noteContent),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            //Delete  note
                            db
                                .deleteNote(snapshot.data![index].noteId!)
                                .whenComplete(() => _repfresh());
                          },
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return const Center(child: Text('No data'));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    ));
  }

  Widget snackBarView() {
    return SnackBar(
      content: Text("Xin vchao"),
      action: SnackBarAction(label: 'oke', onPressed: () {}),
    );
  }
}
