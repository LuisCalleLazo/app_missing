import 'package:flutter/material.dart';

class InputControllerManager {
  final Map<String, TextEditingController> _controllers = {};

  TextEditingController getController(String name) {
    if (!_controllers.containsKey(name)) {
      _controllers[name] = TextEditingController();
    }
    return _controllers[name]!;
  }
  
  void setControllerValue(String name, String value) {
    final controller = getController(name);
    controller.text = value;
  }

  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
  }

  Map<String, String> getAllValues() {
    return _controllers
        .map((key, controller) => MapEntry(key, controller.text));
  }
}
