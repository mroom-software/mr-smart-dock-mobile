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

class FinishButtonPressed extends ProfileEvent {
  final String workingHours;
  final int weight;
  final int height;
  final int waterGoal; 

  FinishButtonPressed({
    @required this.workingHours,
    @required this.weight,
    @required this.height,
    @required this.waterGoal}) : super([workingHours, weight, height, waterGoal]);
  
  @override
  String toString() => 'FinishButtonPressed { workingHours: $workingHours, weight: $weight, height: $height, waterGoal: $waterGoal }';
}