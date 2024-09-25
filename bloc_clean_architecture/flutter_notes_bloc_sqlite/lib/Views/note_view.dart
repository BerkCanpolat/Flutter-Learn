import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes_bloc_sqlite/note_bloc/note_bloc.dart';
import 'package:flutter_notes_bloc_sqlite/note_bloc/note_event.dart';
import 'package:flutter_notes_bloc_sqlite/note_bloc/note_state.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AllNotes extends StatefulWidget {
  const AllNotes({super.key});

  @override
  State<AllNotes> createState() => _AllNotesState();
}

class _AllNotesState extends State<AllNotes> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<NoteBloc>().add(GetAllNoteEvent());
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: BlocConsumer<NoteBloc, NoteState>(
        listener: (context, state) {
          
        },
        builder: (context, state) {
          if(state is LoadedState) {
            return state.allNotes.isEmpty ? const Center(child: Text('No Data'),) : MasonryGridView.builder(
              gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
                ), 
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(state.allNotes[index].title)
                  ],
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}