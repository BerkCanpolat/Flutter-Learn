import 'package:bloc/bloc.dart';
import 'package:flutter_notes_bloc_sqlite/Databasehelper/repository.dart';
import 'package:flutter_notes_bloc_sqlite/note_bloc/note_event.dart';
import 'package:flutter_notes_bloc_sqlite/note_bloc/note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final Repository repository;
  NoteBloc(this.repository) : super(NoteInitial()) {
    on<GetAllNoteEvent>((event, emit) async{
      emit(LoadingState());
      try {
        final notes = await repository.getNotes();
        emit(LoadedState(notes));
      } catch (e) {
        emit(FailureState(e.toString()));
      }
    },);
  }
}