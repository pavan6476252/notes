

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; 

import '../../repository/nnotes_model.dart';
import 'note_event.dart';
import 'note_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final FirebaseFirestore firestore;

  NotesBloc(this.firestore) : super(NotesInitial()) {
    on<LoadNotes>(_mapLoadNotesToState);
    on<AddNote>(_mapAddNoteToState);
    on<UpdateNote>(_mapUpdateNoteToState);
    on<DeleteNote>(_mapDeleteNoteToState);
  }

  Future<void> _mapLoadNotesToState(
      LoadNotes event, Emitter<NotesState> emit) async {
    emit(NotesLoading());
    try {
      final notesSnapshot = await firestore.collection('notes').get();
      final notes =
          notesSnapshot.docs.map((doc) => Note.fromSnapshot(doc)).toList();

      emit(NotesLoaded(notes));
    } catch (e) {
      emit(const NotesError('Failed to load notes'));
    }
  }

  Future<void> _mapAddNoteToState(
      AddNote event, Emitter<NotesState> emit) async {
    emit(NotesLoading());
    try {
      final note = Note(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: event.title,
        content: event.content,
      );

      await firestore.collection('notes').doc(note.id).set(note.toJson());
      emit(NoteAdded());
      add(LoadNotes());  
    } catch (e) {
      emit(const NotesError('Failed to add note'));
    }
  }

  Future<void> _mapUpdateNoteToState(
      UpdateNote event, Emitter<NotesState> emit) async {
    emit(NotesLoading());
    try {
      final note = event.note;

      await firestore.collection('notes').doc(note.id).update(note.toJson());

      emit(NoteUpdated());
      add(LoadNotes()); // Reload the content after updating a note
    } catch (e) {
      emit(const NotesError('Failed to update note'));
    }
  }

  Future<void> _mapDeleteNoteToState(
      DeleteNote event, Emitter<NotesState> emit) async {
    emit(NotesLoading());
    try {
      await firestore.collection('notes').doc(event.noteId).delete();

      emit(NoteDeleted());
      add(LoadNotes());  
    } catch (e) {
      emit(const NotesError('Failed to delete note'));
    }
  }

  @override
  Future<void> close() {  
    return super.close();
  }
}
