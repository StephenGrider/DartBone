import 'dart:html';
import '../lib/collection.dart';
import '../lib/view.dart';
import 'todo_model.dart';

class TodosAddView extends View {
  Collection collection;

  TodosAddView({this.collection, model, parent})
      : super(model: model, parent: parent);

  String template() {
    return """
      <div>
        Enter new todo:
        <input />
        <button>Add</button>
      </div>
    """;
  }

  Map<String, Function> events() {
    return {'click:button': onButtonClick};
  }

  onButtonClick(event) {
    var input = find('input') as InputElement;

    collection.add(
      new TodoModel(attributes: {'task': input.value}),
    );

    input.value = '';
  }
}
