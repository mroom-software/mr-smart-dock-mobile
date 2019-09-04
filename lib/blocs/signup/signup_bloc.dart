import 'package:smart_dock_mobile/blocs/auth/auth_bloc.dart';
import 'package:smart_dock_mobile/blocs/auth/auth_events.dart';
import 'package:bloc/bloc.dart';
import 'package:smart_dock_mobile/blocs/signup/signup_events.dart';
import 'package:smart_dock_mobile/blocs/signup/signup_states.dart';
import 'package:smart_dock_mobile/repositories/user_repos.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final BaseUserRepository userRepository;
  final AuthBloc authBloc;

  SignupBloc({this.userRepository, this.authBloc}) : assert(userRepository != null), assert(authBloc != null);

  @override
  SignupState get initialState => SignupInitial();

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if (event is SignupButtonPressed) {
      yield SignupLoading();
      try {
        final user = await userRepository.signup(
          firstName: event.firstName,
          lastName: event.lastName,
          dob: event.dob,
          gender: event.gender,
          email: event.email,
          password: event.password,
        );

        if (user != null) {
          authBloc.dispatch(LoggedIn(user: user));
          yield SignupSuccess();
        } else {
          yield SignupFailure(error: 'Signup Failed');
        }
        
      } catch (error) {
        yield SignupFailure(error: error.toString());
      }
    }
  }
  
}