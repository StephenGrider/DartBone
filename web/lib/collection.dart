import 'dart:collection';
import 'dart:async';
import 'model.dart';

class Collection extends ListBase {
  final List models = [];
  final events = new StreamController<String>.broadcast();

  int get length => models.length;
  Model operator [](int index) => models[index];

  void operator []=(int index, Model model) {
    models[index] = model;
    trigger('change');
  }

  void set length(int newLength) {
    models.length = newLength;
  }

  trigger(String eventName) {
    events.add(eventName);
  }
}
