import 'package:smart_dock_mobile/blocs/auth/auth_bloc.dart';
import 'package:smart_dock_mobile/blocs/auth/auth_events.dart';
import 'package:smart_dock_mobile/blocs/login/login_events.dart';
import 'package:smart_dock_mobile/blocs/login/login_states.dart';
import 'package:bloc/bloc.dart';
import 'package:smart_dock_mobile/repositories/user_repos.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final BaseUserRepository userRepository;
  final AuthBloc authBloc;

  LoginBloc({this.userRepository, this.authBloc}) : assert(userRepository != null), assert(authBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {

    // normal login
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        final user = await userRepository.authenticate(
          email: event.email,
          password: event.password,
        );

        if (user != null) {
          yield LoginSuccess();
          authBloc.dispatch(LoggedIn(user: user));
        } else {
          yield LoginFailure(error: 'Login Failed');
        }
        
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }

    // social login
    if (event is LoginGoogleButtonPressed) {
      yield LoginLoading();
      try {
        final user = await userRepository.authenticateSocialAccount(
          fullName: event.fullName,
          email: event.email,
          socialID: event.socialID,
          socialToken: event.socialToken,
          socialType: event.socialType,
        );

        if (user != null) {
          yield LoginSuccess();
          authBloc.dispatch(LoggedIn(user: user));
        } else {
          yield LoginFailure(error: 'Login Failed');
        }
        
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
  
}