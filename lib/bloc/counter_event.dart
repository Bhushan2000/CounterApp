part of 'counter_bloc.dart';

/// EVENTS represent WHAT user wants to do.
/// Example: increment, decrement, fetch data, login, etc.
abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

class IncrementEvent extends CounterEvent{
  @override
  List<Object?> get props => [];
}

class DecrementEvent extends CounterEvent{
  @override
  List<Object?> get props => [];
  
}