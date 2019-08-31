

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SetupState extends Equatable{
  SetupState([List props = const[]]) : super([props]);
}

class SetupInitial extends SetupState {
  @override
  String toString() => 'SetupInitial';
}

class SetupLoading extends SetupState {
  @override
  String toString() => 'SetupLoading';
}

class SetupFailure extends SetupState {
  final String error;

  SetupFailure({@required this.error}) : super([error]);

  @override
  String toString() => 'SetupFailure { error: $error }';
}

class SetupSuccess extends SetupState {
  @override
  String toString() => 'SetupSuccess';
}