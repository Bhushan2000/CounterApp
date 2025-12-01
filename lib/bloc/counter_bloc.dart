import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_event.dart';
part 'counter_state.dart';

/// BLoC = Business Logic Component
/// It receives EVENT (user action),
/// processes logic,
/// outputs a new STATE.
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(counter: 0)) {
    /// When IncrementEvent is triggered → increase counter
    on<IncrementEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1));

    });

      /// When DecrementEvent is triggered → decrease counter
    on<DecrementEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter - 1));

    });

  }
}
