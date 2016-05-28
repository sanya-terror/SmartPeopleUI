import 'dart:async';

import 'action.dart';
import 'reducer.dart';
import 'middleware.dart';

typedef Future<dynamic> Dispatcher(Action action);
typedef Dispatcher Pipe(Dispatcher next);

class Store {
  Reducer _reducer;
  Map<dynamic, dynamic> _currentState;
  Middleware _middleware;

  Store(Reducer reducer, {Map<String, dynamic> initialState: const {}, Middleware middleware}) {
    if (initialState == null) throw new ArgumentError.notNull("initialState");

    if (middleware != null) this._middleware = middleware;

    _reducer = reducer;
    _currentState = initialState;
  }

  get state => _currentState;

  bool _isMiddlewareExecuting = false;
  Future<dynamic> dispatch(Action action) async {
    if (_middleware != null && !_isMiddlewareExecuting) {
      _isMiddlewareExecuting = true;
      return await _middleware(this)(dispatch)(action);
    }

    _isMiddlewareExecuting = false;

    _currentState = _reducer(_currentState, action);

    _listeners.forEach((listener) => listener());

    return await action;
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
