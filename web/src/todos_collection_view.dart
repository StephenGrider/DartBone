import '../lib/collection_view.dart';
import 'todo_view.dart';

class TodosCollectionView extends CollectionView {
  TodosCollectionView({collection, containerTag, parent})
      : super(
          collection: collection,
          containerTag: containerTag,
          parent: parent,
        );

  renderItem(model, parent) {
    return new TodoView(model: model, parent: parent);
  }
}
