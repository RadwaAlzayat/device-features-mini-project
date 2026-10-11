import 'package:device_features_mini_project/services/device_info_service.dart';
import 'package:flutter/material.dart';

class DeviceInfoScreen extends StatefulWidget {
  const DeviceInfoScreen({super.key});

  @override
  State<DeviceInfoScreen> createState() => _DeviceInfoScreenState();
}

class _DeviceInfoScreenState extends State<DeviceInfoScreen> {
  late final Future<String> _deviceDescription;

  @override
  void initState() {
    super.initState();
    // Fetch device info
    _deviceDescription = DeviceInfoService().getDeviceDescription();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Device Info')),
      body: FutureBuilder<String>(
        future: _deviceDescription,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(
              child: Text(
                snapshot.data ?? 'No data',
                textAlign: TextAlign.center,
              ),
            );
          }
        },
      ),
    );
  }
}
