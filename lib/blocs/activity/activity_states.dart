

import 'package:equatable/equatable.dart';

abstract class ActivityState extends Equatable{
  ActivityState([List props = const[]]) : super([props]);
}

class ActivityInitial extends ActivityState {
  @override
  String toString() => 'ActivityInitial';
}

class ActivityLoading extends ActivityState {
  @override
  String toString() => 'ActivityLoading';
}