import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      /// Provide CounterBloc to the entire app
      create: (_) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// NO BlocProvider here!
    /// Because Bloc is already injected globally in main()

    return Scaffold(
      appBar: AppBar(title: const Text("BLoC Beginner Example")),

      body: Center(
        /// BlocBuilder rebuilds UI whenever state changes
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text(
              "Counter: ${state.counter}",
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          /// Increase Button
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              /// Dispatch Increment Event to BLoC
              context.read<CounterBloc>().add(IncrementEvent());
            },
          ),

          const SizedBox(height: 12),

          /// Decrease Button
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () {
              /// Dispatch Decrement Event
              context.read<CounterBloc>().add(DecrementEvent());
            },
          ),
        ],
      ),
    );
  }
}
