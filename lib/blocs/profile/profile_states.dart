
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable{
  ProfileState([List props = const[]]) : super([props]);
}

class ProfileInitial extends ProfileState {
  @override
  String toString() => 'ProfileInitial';
}

class ProfileLoading extends ProfileState {
  @override
  String toString() => 'ProfileLoading';
}

class ProfileLoadGoalFinish extends ProfileState {
  final int goal;

  ProfileLoadGoalFinish({this.goal}) : super([goal]);

  @override
  String toString() => 'ProfileLoadGoalFinish { goal: $goal }';
}

class ProfileFailure extends ProfileState {
  final String error;

  ProfileFailure({@required this.error}) : super([error]);

  @override
  String toString() => 'ProfileFailure { error: $error }';
}

class ProfileFinish extends ProfileState {
  @override
  String toString() => 'ProfileFinish';
}