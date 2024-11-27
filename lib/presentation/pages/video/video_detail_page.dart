import 'package:flutter/material.dart';

class VideoDetailPage extends StatelessWidget {
  static String name = "video_detail";
  const VideoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detalles del video",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
