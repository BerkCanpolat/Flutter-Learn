import 'package:bloc/bloc.dart';
import 'package:flutter_notes_bloc_sqlite/Databasehelper/repository.dart';
import 'package:flutter_notes_bloc_sqlite/Models/note_model.dart';
import 'package:flutter_notes_bloc_sqlite/note_bloc/note_event.dart';
import 'package:flutter_notes_bloc_sqlite/note_bloc/note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final Repository repository;
  NoteBloc(this.repository) : super(NoteInitial()) {
    on<GetAllNoteEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final notes = await repository.getNotes();
        print("Fetched notes count: ${notes.length}");
        emit(LoadedState(notes));
      } catch (e) {
        emit(FailureState(e.toString()));
      }
    },);

    on<AddNoteEvent>((event, emit) async {
      emit(LoadingState());
      try {
        await Future.delayed(const Duration(seconds: 3));
        int res = await repository.addNote(Notes(
          title: event.notes.title,
           content: event.notes.content, 
           createdAt: event.notes.createdAt));
           if(res>0) {
            emit(SuccessNoteInsertion());
            add(GetAllNoteEvent());
           }
      } catch (e) {
        emit(FailureState(e.toString()));
      }
    },);

    on<GetByIdNoteEvent>((event, emit) async {
      try {
        final notes = await repository.getNoyById(event.id);
        emit(GetNoteByIdState(notes));
      } catch (e) {
        emit(FailureState(e.toString()));
      }
    },);

    on<UpdateNoteEvent>((event, emit) async {
      try {
        final note = await repository.updateNote(Notes(
          noteId: event.notes.noteId,
          title: event.notes.title, 
          content: event.notes.content, 
          createdAt: event.notes.createdAt
          ));
          if(note > 0) {
            emit(SuccessNoteUpdate());
            add(GetAllNoteEvent());
          }
      } catch (e) {
        emit(FailureState(e.toString()));
      }
    },);

    on<DeleteNoteEvent>((event, emit) async {
      try {
        final notes = await repository.deleteNot(event.id);
        if(notes > 0) {
          emit(SuccessNoteDelete());
          add(GetAllNoteEvent());
        }
      } catch (e) {
        emit(FailureState(e.toString()));
      }
    },);
  }
}