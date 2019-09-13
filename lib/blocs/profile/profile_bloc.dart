import 'package:bloc/bloc.dart';
import 'package:smart_dock_mobile/blocs/profile/profile_events.dart';
import 'package:smart_dock_mobile/blocs/profile/profile_states.dart';
import 'package:smart_dock_mobile/data/models/user.dart';
import 'package:smart_dock_mobile/repositories/user_repos.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository userRepository;

  ProfileBloc({this.userRepository}) : assert(userRepository != null);

  @override
  ProfileState get initialState => ProfileInitial();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if(event is LoadWaterGoal) {
      int goal = await userRepository.userWaterGoal(event.workingHours);
      yield ProfileLoadGoalFinish(goal: goal);
    }

    if (event is FinishButtonPressed) {
      User user = await userRepository.updateUserProfile(
        workingHours: event.workingHours,
        weight: event.weight,
        height: event.height,
        goal: event.waterGoal,
      );

      if (user == null) {
        yield ProfileFailure(error: 'Cannot update profile');
      } else {
        yield ProfileFinish();
      }
    }
  }


}