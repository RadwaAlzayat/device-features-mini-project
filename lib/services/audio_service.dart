import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class AudioService {
  final AudioRecorder _recorder = AudioRecorder();
  final AudioPlayer _player = AudioPlayer();

  /// Starts recording if the microphone permission is granted.
  /// Returns false when the permission is denied.
  Future<bool> startRecording() async {
    if (!await _recorder.hasPermission()) return false;

    // On web the browser manages the recording, so no file path is needed.
    var path = '';
    if (!kIsWeb) {
      final directory = await getTemporaryDirectory();
      // A new file name per recording avoids clashing with the player.
      path =
          '${directory.path}/recording_${DateTime.now().millisecondsSinceEpoch}.m4a';
    }

    await _recorder.start(const RecordConfig(), path: path);
    return true;
  }

  /// Stops recording and returns the saved file path (a blob URL on web).
  Future<String?> stopRecording() async {
    return _recorder.stop();
  }

  /// Plays the recording located at [path].
  Future<void> playRecording(String path) async {
    final source = kIsWeb ? UrlSource(path) : DeviceFileSource(path);
    await _player.play(source);
  }

  /// Stops the audio if it is currently playing.
  Future<void> stopPlayback() async {
    await _player.stop();
  }

  /// Releases the recorder and player resources.
  void dispose() {
    _recorder.dispose();
    _player.dispose();
  }
}
