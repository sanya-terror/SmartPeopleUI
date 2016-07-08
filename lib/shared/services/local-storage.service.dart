import 'dart:html' show window;
import 'package:angular2/core.dart' show Injectable;

@Injectable()
class LocalStorageService {
  getItem(key) => window.localStorage[key];
  setItem(key, value) => window.localStorage[key] = value;
  remove(key) => window.localStorage.remove(key);
  clear() => window.localStorage.clear();
  containsKey(key) => window.localStorage.containsKey(key);
}
