part of 'counter_bloc.dart';

/// STATES represent the data of the UI.
/// Example: loading, success, error, counter value, etc.
class CounterState extends Equatable {
  final int counter;

  const CounterState({required this.counter});

  // copy state with updated counter -> safe & immutable
  CounterState copyWith({int? counter}) {
    return CounterState(counter: counter ?? this.counter);
  }

  @override
  List<Object?> get props => [counter];
}
