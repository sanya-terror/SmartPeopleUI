typedef Map<String, dynamic> Reducer(Map<String, dynamic> state, Map<String, dynamic> action);
typedef Map<String, dynamic> Dispatcher(Map<String, dynamic> action);
typedef Dispatcher Pipe(Dispatcher next);
typedef Pipe Enhancer(Store store);

class Store {

  Reducer _reducer;
  Map<dynamic, dynamic> _currentState;
  Function _enhancer;

  Store(Reducer reducer, {Map<String, dynamic> initialState : const {}, Enhancer enhancer}) {

    if(initialState == null)
      throw new ArgumentError.notNull("initialState");

    if (enhancer != null)
      this._enhancer = enhancer;

    _reducer = reducer;
    _currentState = initialState;
  }

  get state => _currentState;

  bool isMiddlewareExecuting = false;
  Map<String, dynamic> dispatch(Map<String, dynamic> action) {

    if (_enhancer != null && !isMiddlewareExecuting) {
      isMiddlewareExecuting = true;
      return _enhancer(this)(dispatch)(action);
    }

    isMiddlewareExecuting = false;

    if (!action.containsKey('type'))
      throw new ArgumentError.notNull('there is no action type');

    _currentState = _reducer(_currentState, action);

    _listeners.forEach((listener) => listener());

    return action;
  }

  List<Function> _listeners = [];
  Function subscribe(Function listener) {
    _listeners.add(listener);

    var isSubscribed = true;

    return () {
      if (!isSubscribed) {
        return;
      }

      isSubscribed = false;
      _listeners.remove(listener);
    };
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