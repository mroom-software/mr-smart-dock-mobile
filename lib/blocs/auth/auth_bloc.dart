

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_dock_mobile/blocs/auth/auth_events.dart';
import 'package:smart_dock_mobile/blocs/auth/auth_states.dart';
import 'package:smart_dock_mobile/data/models/user.dart';
import 'package:smart_dock_mobile/repositories/user_repos.dart';


class AuthBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  final UserRepository userRepository;

  AuthBloc({@required this.userRepository}) : assert(userRepository != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is AppStarted) {
      User user = await userRepository.currentUser();
      if (user != null) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      bool result = await userRepository.logout();
      if (result) {
        yield AuthenticationUnauthenticated();
      } else {
        yield AuthenticationError();
      }
      
    }
  }

}