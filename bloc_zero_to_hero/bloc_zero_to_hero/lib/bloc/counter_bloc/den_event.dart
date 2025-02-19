import 'package:equatable/equatable.dart';

abstract class DenEvent extends Equatable{
  const DenEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ToplamGoster extends DenEvent{}

class ToplamCikart extends DenEvent{}