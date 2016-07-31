import 'dart:html' show window;
import 'package:angular2/core.dart' show Injectable;

@Injectable()
class SessionStorageService {
  String getItem(key) => window.sessionStorage[key];
  void setItem(key, value) => window.sessionStorage[key] = value;
  String remove(key) => window.localStorage.remove(key);
  void clear() => window.sessionStorage.clear();
  bool containsKey(key) => window.sessionStorage.containsKey(key);
}
