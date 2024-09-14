part of 'image_bloc.dart';

class ImageState extends Equatable {
  final XFile? fileState;
  const ImageState({this.fileState});

  ImageState copyWith({XFile? fileState}) {
    return ImageState(
      fileState: fileState ?? this.fileState
    );
  }
  
  @override
  List<Object?> get props => [fileState];
}