import 'dart:html' show window;
import 'package:angular2/core.dart';

@Injectable()
class LocalStorageService {
  getItem(key) => window.localStorage[key];
  setItem(key, value) => window.localStorage[key] = value;
  clear() => window.localStorage.clear();
  containsKey(key) => window.localStorage.containsKey(key);
}