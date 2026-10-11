import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  /// Opens the gallery and returns all images the user selected.
  Future<List<XFile>> pickImagesFromGallery() async {
    return _picker.pickMultiImage();
  }
}
