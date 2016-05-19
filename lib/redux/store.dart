typedef Map<String, dynamic> Reducer(Map<String, dynamic> state, Map<String, dynamic> action);
typedef Map<String, dynamic> Dispatcher(Map<String, dynamic> action);
typedef Dispatcher Pipe(Dispatcher next);
typedef Pipe Enhancer(Store store);

class Store {

  Reducer _reducer;
  Map<dynamic, dynamic> _currentState;

  Function _enhancer;
  bool isMiddlewareExecuting = false;

  Store(Reducer reducer, [Map<String, dynamic> initialState = const {}, Enhancer enhancer]) {

    if (enhancer != null) {
      this._enhancer = enhancer;
    }

    _reducer = reducer;
    _currentState = initialState;
  }

  dispatch(Map<String, dynamic> action) {

    if (_enhancer != null && !isMiddlewareExecuting) {
      isMiddlewareExecuting = true;
      return _enhancer(this)(dispatch)(action);
    }

    isMiddlewareExecuting = false;

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

  subscribeOnce(Function listener) {
    //TODO AN: subscription which will be removed after first execution
    throw new UnimplementedError();
  }

  replaceReducer() {
    //TODO AN: if we really need it
    throw new UnimplementedError();
  }
}