import '../lib/view.dart';

class TodoView extends View {
  TodoView({model, parent}) : super(model: model, parent: parent);

  String template() {
    return """
      <li>${model.attributes['task']}</li>
    """;
  }
}
