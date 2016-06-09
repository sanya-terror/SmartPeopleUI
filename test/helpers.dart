import 'package:mockito/mockito.dart';
import 'package:SmartPeopleUI/shared/index.dart';
import 'package:angular2/router.dart';

import 'package:angular2/core.dart' show PACKAGE_ROOT_URL, Provider, reflector;
import 'package:angular2/src/testing/test_injector.dart' show setBaseTestProviders;
import 'package:angular2/platform/testing/browser.dart'
show TEST_BROWSER_APPLICATION_PROVIDERS, TEST_BROWSER_PLATFORM_PROVIDERS;
import 'package:angular2/src/core/reflection/reflection_capabilities.dart' show ReflectionCapabilities;

/// Replacement of the function with the same name of Angular to replace the
/// default `PACKAGE_ROOT_URL` `/packages` with `packages`
void initAngularTests() {
  reflector.reflectionCapabilities = new ReflectionCapabilities();
  // ignore: constant_identifier_names
  const CUSTOM_TEST_BROWSER_APPLICATION_PROVIDERS = const [
    TEST_BROWSER_APPLICATION_PROVIDERS,
    const Provider(PACKAGE_ROOT_URL, useValue: "packages")
  ];
  setBaseTestProviders(TEST_BROWSER_PLATFORM_PROVIDERS,  CUSTOM_TEST_BROWSER_APPLICATION_PROVIDERS);
}


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

getMockStore() => spy(new MockStore(), new InjectableStore(null));
getRouter() => spy(new MockRouter(), new Router(null, null, null));
getLocation() => spy(new MockLocation(), new Location(null));

