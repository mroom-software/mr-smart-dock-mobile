

import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable{
  HomeState([List props = const[]]) : super([props]);
}

class HomeInitial extends HomeState {
  @override
  String toString() => 'HomeInitial';
}

class HomeNeedUpdateProfile extends HomeState {
  @override
  String toString() => 'HomeNeedUpdateProfile';
}