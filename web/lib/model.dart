import 'dart:async';

abstract class Model {
  Map<String, Object> attributes;
  final events = new StreamController<String>.broadcast();

  Model({this.attributes});

  void set(key, value) {
    attributes[key] = value;
    trigger('change');
  }

  trigger(String eventName) {
    events.add(eventName);
  }
}
