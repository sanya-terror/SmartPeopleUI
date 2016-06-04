import 'package:mockito/mockito.dart';
import 'package:SmartPeopleUI/shared/index.dart';

class MockStore extends Mock implements InjectableStore {
  noSuchMethod(i) => super.noSuchMethod(i);
}

getMockStore() => spy(new MockStore(), new InjectableStore(null));

