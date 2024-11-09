import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class VideoPlayerDev extends StatefulWidget {
  const VideoPlayerDev({Key? key}) : super(key: key);

  @override
  _VideoPlayerDevState createState() => _VideoPlayerDevState();
}

class _VideoPlayerDevState extends State<VideoPlayerDev> {
  late IOWebSocketChannel _channel;
  Uint8List? _imageData;

  @override
  void initState() {
    super.initState();
    _connectWebSocket();
  }

  void _connectWebSocket() {
    _channel =
        IOWebSocketChannel.connect('ws://10.0.7.170:5000/stream/camera/watch');

    _channel.stream.listen((data) {
      if (data is Uint8List) {
        setState(() {
          _imageData = data;
        });
      } else {
        print('Received non-image data');
      }
    }, onError: (error) {
      print('Error occurred: $error');
    }, onDone: () {
      print('WebSocket connection closed');
    });
  }

  @override
  void dispose() {
    _channel.sink.close(status.normalClosure);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _imageData != null
          ? Image.memory(_imageData!)
          : const Text('No image data received'),
    );
  }
}
