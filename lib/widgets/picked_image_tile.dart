import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickedImageTile extends StatelessWidget {
  const PickedImageTile({super.key, required this.image});

  final XFile image;

  @override
  Widget build(BuildContext context) {
    // On web the picked path is a blob URL, so Image.file can't be used.
    return kIsWeb ? Image.network(image.path) : Image.file(File(image.path));
  }
}
