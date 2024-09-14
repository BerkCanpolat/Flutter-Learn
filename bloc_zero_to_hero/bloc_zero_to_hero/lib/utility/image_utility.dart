import 'package:image_picker/image_picker.dart';

class ImageUtility {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> cameraUtility() async{
    final XFile? file = await _picker.pickImage(source: ImageSource.camera);
    return file;
  }

  Future<XFile?> galleryUtility() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    return file;
  }
}