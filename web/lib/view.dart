import 'dart:html';
import 'model.dart';

abstract class View {
  Model model;
  DocumentFragment el;
  Element parent;
  Map<String, Element> regions = {};

  View({this.model, this.parent}) {
    bindModel();
  }

  String template();

  void onRender() {}
  Map<String, Function> events() => {};
  Map<String, String> regionMap() => {};

  void bindModel() {
    if (model == null) return;

    model.events.stream.listen((String event) {
      switch (event) {
        case 'change':
          render();
          break;
        default:
      }
    });
  }

  Element find(String selector) {
    return parent.querySelector(selector);
  }

  void render() {
    el = new DocumentFragment.html(template());

    mapRegions();
    onRender();
    bindEvents(el);

    parent.append(el);
  }

  void mapRegions() {
    regionMap().forEach((regionName, selector) {
      regions[regionName] = el.querySelector(selector);
    });
  }

  void bindEvents(DocumentFragment el) {
    events().forEach((config, callback) {
      var configList = config.split(':');
      var eventName = configList[0];
      var selector = configList[1];

      el.querySelectorAll(selector).forEach((element) {
        element.addEventListener(eventName, callback);
      });
    });
  }
}
