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

    _currentState = _reducer(_currentState, action);

    return action;
  }

  subscribe() {}

  getState() {
    return _currentState;
  }

  replaceReducer() {}
}