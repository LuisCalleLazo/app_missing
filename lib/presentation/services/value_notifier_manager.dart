import 'package:flutter/material.dart';

class ValueNotifierManager<T> {
  final Map<String, ValueNotifier<T?>> _notifiers = {};

  ValueNotifier<T?> getNotifier(String name) {
    if (!_notifiers.containsKey(name)) {
      _notifiers[name] = ValueNotifier<T?>(null);
    }
    return _notifiers[name]!;
  }

  void dispose() {
    for (var notifier in _notifiers.values) {
      notifier.dispose();
    }
  }

  Map<String, T?> getAllValues() {
    return _notifiers.map((key, notifier) => MapEntry(key, notifier.value));
  }
}
