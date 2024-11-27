import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VideoStreamScreen extends StatefulWidget {
  const VideoStreamScreen({super.key});

  @override
  _VideoStreamScreenState createState() => _VideoStreamScreenState();
}

class _VideoStreamScreenState extends State<VideoStreamScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
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
