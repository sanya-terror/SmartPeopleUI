abstract class ILocalStorageService{
  String getItem(String keyName);
  void setItem(String key, String value);
  void clear();
  bool containsKey(String key);
}
