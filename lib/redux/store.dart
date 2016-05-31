import 'dart:async';

import 'action.dart';
import 'reducer.dart';
import 'middleware.dart';
import 'state.dart';

typedef Future<dynamic> Dispatcher(Action action);
typedef Dispatcher Pipe(Dispatcher next);

class Store extends Stream<State>{
  Reducer _reducer;
  State _currentState;
  Middleware _middleware;

  StreamController<State> _controller;

  Store(Reducer reducer, {State initialState, Middleware middleware}) {

    if (initialState == null)
      initialState = State.emptyState;

    if (middleware != null) this._middleware = middleware;

    _reducer = reducer;
    _currentState = initialState;

    _controller = new StreamController.broadcast();
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
    _controller.add(_currentState);

    return await action;
  }

  subscribeOnce(Function listener) {
    //TODO AN: subscription which will be removed after first execution
    throw new UnimplementedError();
  }

  replaceReducer() {
    //TODO AN: if we really need it
    throw new UnimplementedError();
  }

  @override
  StreamSubscription<State> listen(void onData(State event), {Function onError, void onDone(), bool cancelOnError}) {
    return _controller.stream.listen(onData, onError: onError, onDone: onDone, cancelOnError: cancelOnError);
  }
}
