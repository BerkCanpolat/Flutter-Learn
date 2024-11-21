import 'package:core/src/cache/core/cache_model.dart';

abstract class CacheOperation<T extends CacheModel> {
  void add(T item);
  void addAll(List<T> items);
  void remove(String id);
  void removeAll(List<String> ids);
  void update(T item);
  void updateAll(List<T> items);
  void clear();

  List<T> getAll();
  T? get(String id);
}