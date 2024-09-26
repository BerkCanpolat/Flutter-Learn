import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes_bloc_sqlite/Models/note_model.dart';
import 'package:flutter_notes_bloc_sqlite/note_bloc/note_bloc.dart';
import 'package:flutter_notes_bloc_sqlite/note_bloc/note_event.dart';
import 'package:flutter_notes_bloc_sqlite/note_bloc/note_state.dart';

class UpdateNoteView extends StatefulWidget {
  const UpdateNoteView({super.key});

  @override
  State<UpdateNoteView> createState() => _UpdateNoteViewState();
}

class _UpdateNoteViewState extends State<UpdateNoteView> {
  final title = TextEditingController();
  final content = TextEditingController();
  String createdAt = DateTime.now().toIso8601String();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteBloc, NoteState>(
      listener: (context, state) {
        if(state is SuccessNoteUpdate) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        if(state is GetNoteByIdState) {
          title.text = state.notes.title;
          content.text = state.notes.content;
          return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
          context.read<NoteBloc>().add(GetAllNoteEvent());
        }, icon: const Icon(Icons.abc)),
        actions: [
          state is LoadingState ? const CircularProgressIndicator() : IconButton(
            onPressed: (){
              context.read<NoteBloc>().add(UpdateNoteEvent(Notes(
                noteId: state.notes.noteId,
                title: title.text, 
                content: content.text, 
                createdAt: createdAt),
                ),
              );
            }, 
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: title,
            decoration: const InputDecoration(
              hintText: 'Title',
            ),
          ),
          TextField(
            controller: content,
            decoration: const InputDecoration(
              hintText: 'Content',
              border: InputBorder.none
            ),
            maxLines: null,
            keyboardType: TextInputType.multiline,
          ),
        ],
      ),
    );
        }
        return Container();
      },
    );
  }
}