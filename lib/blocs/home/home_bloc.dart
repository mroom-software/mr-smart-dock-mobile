import 'package:bloc/bloc.dart';
import 'package:smart_dock_mobile/blocs/home/home_events.dart';
import 'package:smart_dock_mobile/blocs/home/home_states.dart';
import 'package:smart_dock_mobile/repositories/user_repos.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserRepository userRepository;

  HomeBloc(this.userRepository) : assert(userRepository != null);

  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeState) {
      yield HomeNeedUpdateProfile();
    }
  }
  
  

}