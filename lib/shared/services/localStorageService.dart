import 'dart:html' show window;
import 'package:angular2/core.dart';

@Injectable()
class LocalStorageService{
  getItem(String keyName) => window.localStorage[keyName];
  setItem(String key, String value) => window.localStorage[key] = value;
  get clear => window.localStorage.clear;
  get containsKey => window.localStorage.containsKey;
}