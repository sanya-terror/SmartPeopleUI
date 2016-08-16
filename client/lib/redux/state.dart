import 'package:collection/collection.dart';

class State extends DelegatingMap<String, dynamic> {
  State(Map<String, dynamic> base) : super(base);

  State.from(State other) : super(new Map.from(other));

  static State get emptyState => new State({});
}
