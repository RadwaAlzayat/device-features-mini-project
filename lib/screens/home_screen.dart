import 'package:device_features_mini_project/screens/audio_screen.dart';
import 'package:device_features_mini_project/screens/device_info_screen.dart';
import 'package:device_features_mini_project/screens/gallery_screen.dart';
import 'package:device_features_mini_project/screens/map_screen.dart';
import 'package:device_features_mini_project/widgets/phase_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Device Features')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: const [
          PhaseButton(
            title: 'Phase 1: Device Info',
            icon: Icons.phone_android,
            destination: DeviceInfoScreen(),
          ),
          SizedBox(height: 16),
          PhaseButton(
            title: 'Phase 2: Gallery',
            icon: Icons.photo_library,
            destination: GalleryScreen(),
          ),
          SizedBox(height: 16),
          PhaseButton(
            title: 'Phase 3: Google Map',
            icon: Icons.map,
            destination: MapScreen(),
          ),
          SizedBox(height: 16),
          PhaseButton(
            title: 'Phase 5: Audio Recorder',
            icon: Icons.mic,
            destination: AudioScreen(),
          ),
        ],
      ),
    );
  }
}
