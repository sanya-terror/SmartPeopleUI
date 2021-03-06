import 'package:angular2/core.dart' show PACKAGE_ROOT_URL, Provider, reflector;
import 'package:angular2/src/testing/test_injector.dart' show resetBaseTestProviders, setBaseTestProviders;
import 'package:angular2/platform/testing/browser.dart'
    show TEST_BROWSER_APPLICATION_PROVIDERS, TEST_BROWSER_PLATFORM_PROVIDERS;
import 'package:angular2/src/core/reflection/reflection_capabilities.dart' show ReflectionCapabilities;
import 'package:angular2/router.dart' as router;
import 'package:angular2/src/core/di.dart';

import 'mocks.dart';
import 'package:angular2/src/router/router.dart';
import 'package:angular2/src/testing/test_component_builder.dart';
import 'package:angular2_testing/angular2_testing.dart' as ngTesting;
import 'package:smartpeople_client/index.dart';
import 'package:angular2/platform/common.dart';

/// Replacement of the function with the same name of Angular to replace the
/// default `PACKAGE_ROOT_URL` `/packages` with `packages`
void initAngularTests() {
  reflector.reflectionCapabilities = new ReflectionCapabilities();
  // ignore: constant_identifier_names
  const CUSTOM_TEST_BROWSER_APPLICATION_PROVIDERS = const [
    TEST_BROWSER_APPLICATION_PROVIDERS,
    const Provider(PACKAGE_ROOT_URL, useValue: "packages")
  ];
  resetBaseTestProviders();
  setBaseTestProviders(TEST_BROWSER_PLATFORM_PROVIDERS, CUSTOM_TEST_BROWSER_APPLICATION_PROVIDERS);
}

void setUpProviders(component, [List<Provider> providers]) {
  if (providers == null) providers = [];
  var mockStore = getMockStore();
  providers.addAll([
    router.RouteRegistry,
    provide(Location, useClass: MockLocation),
    provide(router.Router, useClass: RootRouter),
    provide(router.ROUTER_PRIMARY_COMPONENT, useValue: component),
    TestComponentBuilder,
    LocalStorageService,
    SessionStorageService,
    provide(InjectableStore, useValue: mockStore),
  ]);
  ngTesting.setUpProviders(() => providers);
}
