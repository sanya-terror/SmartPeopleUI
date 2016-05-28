import 'store.dart';
import 'package:fp/fp.dart' show compose;

typedef Pipe Middleware(Store store);

Middleware applyMiddleware(List<Middleware> middlewares) {
  return (Store store) => (next) {
        var chain = [];
        chain = middlewares.map((middleware) => middleware(store)).toList();

        var dispatch = compose(chain)(store.dispatch);

        return dispatch;
      };
}
