import 'dart:async';

abstract class Model {
  Map<String, Object> attributes;
  StreamController<String> events;

  Model({this.attributes}) {
    events = new StreamController<String>();
  }

  void set(key, value) {
    attributes[key] = value;
    events.add('change');
  }

  trigger(String eventName) {
    events.add(eventName);
  }
}
