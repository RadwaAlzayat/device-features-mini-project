import 'package:device_features_mini_project/services/audio_service.dart';
import 'package:flutter/material.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  final AudioService _audioService = AudioService();
  bool _isRecording = false;
  String? _recordedPath;

  // Starts recording, or stops it and keeps the saved file path.
  Future<void> _toggleRecording() async {
    if (_isRecording) {
      final path = await _audioService.stopRecording();
      setState(() {
        _isRecording = false;
        _recordedPath = path;
      });
    } else {
      // Stop any playing audio so it doesn't get mixed into the new recording.
      await _audioService.stopPlayback();
      final started = await _audioService.startRecording();
      if (started) setState(() => _isRecording = true);
    }
  }

  @override
  void dispose() {
    _audioService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Audio Recorder')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _toggleRecording,
              child: Text(_isRecording ? 'Stop Recording' : 'Record Audio'),
            ),
            if (_recordedPath != null) ...[
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isRecording
                    ? null
                    : () => _audioService.playRecording(_recordedPath!),
                child: const Text('Play Audio'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
