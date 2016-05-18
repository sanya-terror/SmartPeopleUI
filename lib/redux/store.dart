typedef Map<String, dynamic> Reducer(Map<String, dynamic> state, Map<String, dynamic> action);

class Store {

  Reducer _reducer;
  Map<dynamic, dynamic> _currentState;
  dynamic _enhancer;

  Store(Reducer this._reducer, [Map<String, dynamic> _initialState = const {}]) {
    this._currentState = _initialState;
  }

  dispatch(Map<String, dynamic> action) {

    if (!action.containsKey('type')) {
      throw new ArgumentError.notNull('there is no action type');
    }

    _currentState = _reducer(_currentState, action);

    listeners.forEach((listener) => listener());

    return action;
  }

  List<Function> listeners = [];

  subscribe(Function listener) {

    listeners.add(listener);

    var isSubscribed = true;

    return () {

      if (!isSubscribed) {
        return;
      }

      isSubscribed = false;
      listeners.remove(listener);
    };
  }

  getState() {
    return _currentState;
  }

  subscribeOnce(Function listener){
    //TODO AN: subscription which will be removed after first execution
    throw new UnimplementedError();
  }

  replaceReducer() {
    //TODO AN: if we really need it
    throw new UnimplementedError();
  }
}