import 'dart:html';
import 'model.dart';

abstract class View {
  Model model;
  DocumentFragment el;
  Element parent;

  Map<String, Function> events();

  View({this.model, this.parent}) {
    bindModel();
  }

  String template();

  void bindModel() {
    model.events.stream.listen((String event) {
      switch (event) {
        case 'change':
          render();
          break;
        default:
      }
    });
  }

  void render() {
    el = new DocumentFragment.html(template());

    events().forEach((config, callback) {
      var configList = config.split(':');
      var eventName = configList[0];
      var selector = configList[1];

      el.querySelectorAll(selector).forEach((element) {
        element.addEventListener(eventName, callback);
      });
    });

    parent.innerHtml = '';
    parent.append(el);
  }
}
