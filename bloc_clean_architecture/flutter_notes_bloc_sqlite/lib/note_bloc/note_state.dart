import 'package:equatable/equatable.dart';
import 'package:flutter_notes_bloc_sqlite/Models/note_model.dart';

sealed class NoteState extends Equatable {
  const NoteState();
}

final class NoteInitial extends NoteState {
  @override
  List<Object?> get props => [];
}

/// LOADİNG STATE
final class LoadingState extends NoteState{
   @override
  List<Object?> get props => [];
}


/// LOADED STATE
/// GET ALL NOTES
final class LoadedState extends NoteState {
  final List<Notes> allNotes;
  const LoadedState(this.allNotes);
   @override
  List<Object?> get props => [allNotes];
}

/// IN CASE WHEN THERE IS AN ERROR
final class FailureState extends NoteState {
  final String errorMessage;
  const FailureState(this.errorMessage);
   @override
  List<Object?> get props => [errorMessage];
}

/// SUCCESS NOTE ADD INSERTION
final class SuccessNoteInsertion extends NoteState {
   @override
  List<Object?> get props => [];
}


/// SUCCESS NOTE UPDATE
final class SuccessNoteUpdate extends NoteState {
   @override
  List<Object?> get props => [];
}


/// SUCCESS NOTE DELETE
final class SuccessNoteDelete extends NoteState {
   @override
  List<Object?> get props => [];
}


/// GET NOT BY ID
final class GetNoteByIdState extends NoteState {
  final Notes notes;
  const GetNoteByIdState(this.notes);
   @override
  List<Object?> get props => [notes];
}