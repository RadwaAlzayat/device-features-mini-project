import 'package:device_features_mini_project/services/image_picker_service.dart';
import 'package:device_features_mini_project/widgets/picked_image_tile.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final List<XFile> _selectedImages = [];
  final ImagePickerService _imagePickerService = ImagePickerService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gallery')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: ListView.builder(
                itemCount: _selectedImages.length,
                itemBuilder: (BuildContext context, int index) {
                  return PickedImageTile(image: _selectedImages[index]);
                },
              ),
            ),
          ),
          FilledButton(onPressed: _pickImages, child: const Text('Pick Image')),
        ],
      ),
    );
  }

  Future<void> _pickImages() async {
    final pickedImages = await _imagePickerService.pickImagesFromGallery();
    if (pickedImages.isEmpty) return;
    setState(() => _selectedImages.addAll(pickedImages));
  }
}
