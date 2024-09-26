import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes_bloc_sqlite/Models/note_model.dart';
import 'package:flutter_notes_bloc_sqlite/note_bloc/note_bloc.dart';
import 'package:flutter_notes_bloc_sqlite/note_bloc/note_event.dart';
import 'package:flutter_notes_bloc_sqlite/note_bloc/note_state.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({super.key});

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  final title = TextEditingController();
  final content = TextEditingController();
  String createdAt = DateTime.now().toIso8601String();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteBloc, NoteState>(
      listener: (context, state) {
        if(state is SuccessNoteInsertion) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
        actions: [
          state is LoadingState ? const CircularProgressIndicator() : IconButton(
            onPressed: (){
              context.read<NoteBloc>().add(AddNoteEvent(Notes(
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
      },
    );
  }
}