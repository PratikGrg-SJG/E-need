part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counter;
  const CounterState(this.counter);

  CounterState copyWith({int? counter}) =>
      CounterState(counter ?? this.counter);

  @override
  List<Object> get props => [counter];
}
