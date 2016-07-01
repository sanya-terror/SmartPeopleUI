import 'package:test/test.dart';

get notNullPredicate => predicate((f) => f(null) == false);
