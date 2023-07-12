
import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {}

class Fetch extends PostEvent {
  @override
  String toString() => 'Fetch';

  @override
  List<Object> get props => [];
}


class ItemsEventRefresh extends PostEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}