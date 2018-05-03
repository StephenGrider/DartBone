import 'dart:html';
import '../lib/view.dart';
import '../lib/model.dart';
import '../lib/collection.dart';

abstract class CollectionView {
  String containerTag;
  Collection collection;
  Element parent;

  CollectionView({this.collection, this.containerTag, this.parent}) {
    bindCollection();
  }

  void bindCollection() {
    collection.events.stream.listen((event) {
      switch (event) {
        case 'change':
          render();
          break;
        default:
      }
    });
  }

  View renderItem(Model model, Element parent);

  render() {
    var containerElement = new Element.tag(containerTag);

    collection.forEach((model) {
      renderItem(model, containerElement).render();
    });

    parent.innerHtml = '';
    parent.append(containerElement);
  }
}
