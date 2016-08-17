import 'action.dart';
import 'state.dart';

typedef State Reducer(State state, Action action);

Reducer combineReducers(List<Reducer> reducers) =>
    (State state, Action action) => reducers.fold(state, (currentState, reducer) => reducer(currentState, action));
