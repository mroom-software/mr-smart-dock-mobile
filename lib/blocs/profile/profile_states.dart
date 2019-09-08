

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