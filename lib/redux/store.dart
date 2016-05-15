import 'action.dart';

typedef Map<String, dynamic> Reducer(Map<String, dynamic> state, Action action);

class Store {

  Reducer _reducer;
  Map<dynamic, dynamic> _currentState;
  dynamic _enhancer;

  bool _isDispatching = false;

  Store(Reducer this._reducer, [Map<String, dynamic> _initialState = const {}]) {
    this._currentState = _initialState;
  }

  dispatch(Action action) {

    if (_isDispatching) {
      throw new StateError('Reducers may not dispatch actions.');
    }

    try {
      _isDispatching = true;
      _currentState = _reducer(_currentState, action);
    }
    finally {
      _isDispatching = false;
    }

    return action;
  }

  subscribe() {}

  getState() {
    return _currentState;
  }

  replaceReducer() {}
}