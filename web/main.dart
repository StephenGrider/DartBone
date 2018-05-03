import 'dart:html';
import 'src/header_view.dart';
import 'src/counter_model.dart';

void main() {
  var model = new CounterModel();

  var headerView = new HeaderView(model: model, parent: document.body);

  headerView.render();
}
