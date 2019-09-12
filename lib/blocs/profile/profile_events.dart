import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  ProfileEvent([List props = const []]) : super(props);
}

class LoadWaterGoal extends ProfileEvent {
  final String workingHours;

  LoadWaterGoal({
    @required this.workingHours}) : super([workingHours]);
  
  @override
  String toString() => 'LoadWaterGoal { workingHours: $workingHours }';

}