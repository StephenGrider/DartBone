import '../lib/view.dart';
import '../lib/collection.dart';
import 'todo_model.dart';
import 'todos_collection_view.dart';
import 'todos_add_view.dart';

class App extends View {
  App({model, parent}) : super(model: model, parent: parent);

  String template() {
    return """
      <div>
        Hi, I'm the app!
        <div class="todos-region"></div>
        <div class="add-todos-region"></div>
      </div>
    """;
  }

  regionMap() => {
        'todos': '.todos-region',
        'addTodos': '.add-todos-region',
      };

  onRender() {
    var collection = new Collection();
    collection.addAll([
      new TodoModel(attributes: {'task': 'Take out trash'}),
      new TodoModel(attributes: {'task': 'Do the dishes'}),
      new TodoModel(attributes: {'task': 'Play with dog'}),
    ]);

    new TodosCollectionView(
      collection: collection,
      containerTag: 'ul',
      parent: regions['todos'],
    )..render();

    new TodosAddView(
      collection: collection,
      parent: regions['addTodos'],
    )..render();
  }
}
