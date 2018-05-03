import '../lib/model.dart';

class TodoModel extends Model {
  var attributes = {'task': ''};

  TodoModel({this.attributes}) : super(attributes: attributes);
}
