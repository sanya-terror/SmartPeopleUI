import 'package:test/test.dart';
import 'package:SmartPeopleUI/redux/index.dart';
import 'helpers.dart';

class ApplyMiddlewareTests {
  static run() {
    group('Redux apply middleware', () {
      test('Should apply composed middleware', () async {
        Middleware middleware1 = (store) => (next) => (action) {
              action.data['text'] += ' + "String from 1st middleware"';
              return next(action);
            };

        Middleware middleware2 = (store) => (next) => (action) {
              action.data['text'] += ' + "String from 2nd middleware"';
              return next(action);
            };

        Store store = new Store(testReducer,
            initialState: testState,
            middleware: applyMiddleware([middleware1, middleware2]));

        await store.dispatch(addRecordAction('"String from outside"'));

        expect(store.state, {
          'initialized': true,
          'meaningOfLife': 42,
          'list': [
            {
              'message':
                  '"String from outside" + "String from 1st middleware" + "String from 2nd middleware"'
            },
          ]
        });
      });
    });
  }
}

void main() {
  ApplyMiddlewareTests.run();
}
