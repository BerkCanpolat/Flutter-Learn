import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes_bloc_sqlite/Databasehelper/repository.dart';
import 'package:flutter_notes_bloc_sqlite/Views/note_view.dart';
import 'package:flutter_notes_bloc_sqlite/note_bloc/note_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteBloc(Repository()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AllNotes()
      ),
    );
  }
}