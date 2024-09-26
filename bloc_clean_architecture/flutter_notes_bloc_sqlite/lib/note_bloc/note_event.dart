import 'package:equatable/equatable.dart';
import 'package:flutter_notes_bloc_sqlite/Models/note_model.dart';

sealed class NoteEvent extends Equatable {
  const NoteEvent();
}

/// GET ALL NOTE EVENT
class GetAllNoteEvent extends NoteEvent {
   @override
  List<Object?> get props => [];
}


/// ADD NOTE EVENT
class AddNoteEvent extends NoteEvent{
  final Notes notes;
  const AddNoteEvent(this.notes);
   @override
  List<Object?> get props => [notes];
}


/// UPDATE NOTE EVENT
class UpdateNoteEvent extends NoteEvent{
  final Notes notes;
  const UpdateNoteEvent(this.notes);
   @override
  List<Object?> get props => [notes];
}



/// DELETE NOTE EVENT
class DeleteNoteEvent extends NoteEvent{
  final int id;
  const DeleteNoteEvent(this.id);
   @override
  List<Object?> get props => [id];
}


/// GET NOTE BY ID EVENT
class GetByIdNoteEvent extends NoteEvent{
  final int id;
  const GetByIdNoteEvent(this.id);
   @override
  List<Object?> get props => [id];
}


