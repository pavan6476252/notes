import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_note_page.dart';
import 'edit_note_page.dart';
import '../repository/nnotes_model.dart';
import 'bloc/note_bloc.dart';
import 'bloc/note_event.dart';
import 'bloc/note_state.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late NotesBloc _notesBloc;

  @override
  void initState() {
    super.initState();
    _load();
  }

  _load() {
    _notesBloc = BlocProvider.of<NotesBloc>(context);
    _notesBloc.add(LoadNotes());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NotesBloc, NotesState>(
        builder: (context, state) {
          if (state is NotesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NotesLoaded) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: state.notes.length,
              itemBuilder: (context, index) {
                final note = state.notes[index];
                final random = Random();
                final color = Color.fromARGB(
                  255,
                  random.nextInt(256),
                  random.nextInt(256),
                  random.nextInt(256),
                );

                return Card(
                  color: color,
                  child: InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(state.notes[index].title),
                              content: Text(state.notes[index].content),
                            );
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            note.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(note.content,maxLines: 5),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  _navigateToEditPage(note);
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  _notesBloc.add(DeleteNote(note.id));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is NotesError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _navigateToAddPage();
        },
      ),
    );
  }

  void _navigateToAddPage() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddNotePage()),
    );
    _load();
  }

  void _navigateToEditPage(Note note) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditNotePage(note)),
    );
    _load();
  }
}