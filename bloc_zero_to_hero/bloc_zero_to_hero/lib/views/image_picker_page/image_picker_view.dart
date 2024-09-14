import 'dart:io';

import 'package:bloc_zero_to_hero/bloc/image_picker_bloc/image_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerView extends StatelessWidget {
  const ImagePickerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Picker Bloc'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ImageBloc,ImageState>(
              builder: (context, state) {
                return state.fileState == null ? InkWell(
                  onTap: () {
                    context.read<ImageBloc>().add(GalleryEvent());
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Icon(Icons.camera, color: Colors.white,),
                  )
                )
                :
                Image.file(File(state.fileState!.path.toString()));
        
              },
            )
          ],
        ),
      ),
    );
  }
}