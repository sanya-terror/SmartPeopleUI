import 'dart:html' show window;
import 'package:angular2/core.dart' show Injectable;

@Injectable()
class LocalStorageService {
  String getItem(key) => window.localStorage[key];
  void setItem(key, value) => window.localStorage[key] = value;
  String remove(key) => window.localStorage.remove(key);
  void clear() => window.localStorage.clear();
  bool containsKey(key) => window.localStorage.containsKey(key);
}
