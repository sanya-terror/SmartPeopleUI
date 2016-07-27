import 'dart:html' show window;
import 'package:angular2/core.dart' show Injectable;

@Injectable()
class SessionStorageService {
  getItem(key) => window.sessionStorage[key];
  setItem(key, value) => window.sessionStorage[key] = value;
  remove(key) => window.localStorage.remove(key);
  clear() => window.sessionStorage.clear();
  containsKey(key) => window.sessionStorage.containsKey(key);
}
