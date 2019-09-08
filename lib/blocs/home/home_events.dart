
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  HomeEvent([List props = const []]) : super(props);
}

class HomeStarted extends HomeEvent {
  @override
  String toString() => 'HomeStarted';
}

class HomeSkipProfileUpdate extends HomeEvent {
  @override
  String toString() => 'HomeSkipProfileUpdate';
}