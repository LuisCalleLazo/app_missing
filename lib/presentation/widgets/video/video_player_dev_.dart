import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VideoPlayerDev extends StatefulWidget {
  const VideoPlayerDev({super.key});

  @override
  _VideoPlayerDevState createState() => _VideoPlayerDevState();
}

class _VideoPlayerDevState extends State<VideoPlayerDev> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: InkWell(
        onTap: () {
          context.push('/video/stream');
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue, // Color de fondo
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(
            Icons.play_circle_sharp,
            size: 120,
          ),
        ),
      ),
    );
  }
}
