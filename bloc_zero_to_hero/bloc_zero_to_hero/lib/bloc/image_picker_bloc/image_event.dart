part of 'image_bloc.dart';

abstract class ImageEvent extends Equatable {
  const ImageEvent();

  @override
  List<Object> get props => [];
}


class CameraEvent extends ImageEvent{}

class GalleryEvent extends ImageEvent{}