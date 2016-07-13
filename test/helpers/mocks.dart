import 'package:mockito/mockito.dart';
import 'package:SmartPeopleUI/shared/index.dart';
import 'package:angular2/router.dart';
import 'package:angular2/platform/common.dart';
import 'dart:async';
import 'package:test/test.dart';
import 'package:angular2/angular2.dart';

@Directive(selector: 'empty')
class EmptyComponent{}

class MockStore extends Mock implements InjectableStore {
  noSuchMethod(i) => super.noSuchMethod(i);
}

class MockRouter extends Mock implements Router {
  noSuchMethod(i) => super.noSuchMethod(i);
}

class MockLocation extends Mock implements Location {
  noSuchMethod(i) => super.noSuchMethod(i);
  path() => '';
}

class MockRouterLink extends Mock implements RouterLink {
  noSuchMethod(i) => super.noSuchMethod(i);
}

class MockStream extends Mock implements Stream{
  noSuchMethod(i) => super.noSuchMethod(i);
}

// TODO wrap into static class to have namespace

getMockStore() {
  var mock = spy(new MockStore(), new InjectableStore(null, null));
  when(mock.dispatch(argThat(anything))).thenReturn({});
  return mock;
}
getRouter() {
  var mock = spy(new MockRouter(), new Router(null, null, null));
  when(mock.navigate(argThat(anything))).thenReturn({});
  return mock;
}

getLocation() => spy(new MockLocation(), new Location(null));
getStream() => spy(new MockStream(), new Stream.empty());

