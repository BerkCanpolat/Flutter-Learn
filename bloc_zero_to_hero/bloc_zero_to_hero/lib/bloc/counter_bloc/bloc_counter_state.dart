import 'package:equatable/equatable.dart';

class BlocCounterState extends Equatable {
  final int? counter;

  const BlocCounterState({this.counter});

  BlocCounterState copyWith({int? counter}) {
    return BlocCounterState(
      counter: counter ?? this.counter
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [counter];

}