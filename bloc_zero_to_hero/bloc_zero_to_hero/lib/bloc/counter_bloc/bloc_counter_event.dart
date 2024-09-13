import 'package:equatable/equatable.dart';

abstract class BlocCounterEvent extends Equatable {
  const BlocCounterEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CounterEvent extends BlocCounterEvent{}

class CounterRemoveEvent extends BlocCounterEvent{}