import 'action.dart';

typedef Map<String, dynamic> Reducer(Map<String, dynamic> state, Action action);

class Store {

  Reducer _reducer;
  Map<dynamic, dynamic> _currentState;
  dynamic _enhancer;

  Store(Reducer this._reducer, [Map<String, dynamic> _initialState = const {}]) {
    this._currentState = _initialState;
  }

  dispatch(Action action) {

    try {
      _currentState = _reducer(_currentState, action);
    }catch(error){
      print('Error occured during dispathing action ${action.type}: $error');
    }

    listeners.forEach((listener) => listener());

    return action;
  }

  List<Function> listeners = [];

  subscribe(Function listener) {
    listeners.add(listener);
  }

  getState() {
    return _currentState;
  }

  replaceReducer() {}
}