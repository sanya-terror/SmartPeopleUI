import 'dart:html' show window;
import 'package:angular2/core.dart';

import 'local-storage.interface.dart';

@Injectable()
class LocalStorageService implements ILocalStorageService{
  getItem(key) => window.localStorage[key];
  setItem(key, value) => window.localStorage[key] = value;
  clear() => window.localStorage.clear();
  containsKey(key) => window.localStorage.containsKey(key);
}