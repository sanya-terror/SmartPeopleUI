import 'action.dart';

typedef Map<String, dynamic> Reducer(Map<String, dynamic> state, Action action);

Reducer combineReducers(List<Reducer> reducers) =>
  (Map<String, dynamic> state, Action action) =>
    reducers.fold(state, (currentState, reducer) => reducer(currentState, action));
