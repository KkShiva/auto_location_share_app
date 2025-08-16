import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(AutoShareApp());
}

class AutoShareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Auto Share Location",
      home: Scaffold(
        body: Center(child: LocationWidget()),
      ),
    );
  }
}

class LocationWidget extends StatefulWidget {
  @override
  _LocationWidgetState createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  String _status = "Preparing location...";
  String? _lastMessage; // to save last shared message

  @override
  void initState() {
    super.initState();
    _startFlow();
  }

  Future<void> _startFlow() async {
    // Ask permissions
    if (await Permission.location.request().isDenied) {
      setState(() => _status = "Permission denied.");
      return;
    }

    try {
      // Get location
      Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      String mapsLink = "https://maps.google.com/?q=${pos.latitude},${pos.longitude}";
      String message = "My location: $mapsLink";

      _lastMessage = message;

      // Share via WhatsApp (or system share sheet)
      await Share.share(message);

      setState(() => _status = "Shared successfully!");
    } catch (e) {
      setState(() => _status = "Unable to fetch GPS fix.");
      _lastMessage = "Unable to fetch GPS fix right now.";
      await Share.share(_lastMessage!);
    }
  }

  Future<void> _reShare() async {
    if (_lastMessage != null) {
      await Share.share(_lastMessage!);
    } else {
      setState(() => _status = "No location to re-share yet.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _status,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 40),
        ElevatedButton(
          onPressed: _reShare,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF25D366), // WhatsApp green
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          ),
          child: Text(
            "RE SHARE",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
