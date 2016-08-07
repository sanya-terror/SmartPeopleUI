import 'package:fp/fp.dart' show compose;

import 'store.dart';

typedef Pipe Middleware(Store store);

Middleware applyMiddleware(List<Middleware> middlewares) {
  return (Store store) => (next) {
        var chain = middlewares.map((middleware) => middleware(store)).toList();
        Dispatcher dispatcher = compose(chain)(store.dispatch) as Dispatcher;
        return dispatcher;
      };
}
