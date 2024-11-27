import 'package:flutter/material.dart';

class VideoStreamPage extends StatelessWidget {
  static String name = "video_stream";
  const VideoStreamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Video Stream",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
