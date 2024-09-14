import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_zero_to_hero/utility/image_utility.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImageUtility _utility;
  ImageBloc(this._utility) : super(const ImageState()) {
    on<CameraEvent>(_cameraMethod,);
    on<GalleryEvent>(_galleryMethod,);
  }

  FutureOr<void> _galleryMethod(GalleryEvent event, Emitter<ImageState> emit) async {
    XFile? file = await _utility.galleryUtility();
    emit(state.copyWith(fileState: file));
  }

  FutureOr<void> _cameraMethod(CameraEvent event, Emitter<ImageState> emit) async {
    XFile? file = await _utility.cameraUtility();
    emit(state.copyWith(fileState: file));
  }
}
