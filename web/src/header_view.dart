import 'view.dart';

class HeaderView extends View {
  String template() {
    print(model.attributes['count']);
    return '''
      <div>
        <h1>Hi there!</h1>
        <div>Current count: ${model.attributes['count']}</div>
        <button>Click me</button>
      </div>
    ''';
  }

  HeaderView({model, parent}) : super(model: model, parent: parent);

  Map<String, Function> events() {
    return {'click:button': onButtonClick};
  }

  void onButtonClick(_) {
    model.set('count', (model.attributes['count'] as int) + 1);
  }
}
