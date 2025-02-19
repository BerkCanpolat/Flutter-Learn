import 'package:equatable/equatable.dart';

class DenState extends Equatable{
  final int? counter;

  const DenState({this.counter = 0});

  DenState copyWith({int? counter}) {
    return DenState(
      counter: counter ?? this.counter
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [counter];
}