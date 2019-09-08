import 'package:bloc/bloc.dart';
import 'package:smart_dock_mobile/blocs/profile/profile_events.dart';
import 'package:smart_dock_mobile/blocs/profile/profile_states.dart';
import 'package:smart_dock_mobile/repositories/user_repos.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository userRepository;

  ProfileBloc({this.userRepository}) : assert(userRepository != null);

  @override
  ProfileState get initialState => ProfileInitial();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) {
    return null;
  }


}