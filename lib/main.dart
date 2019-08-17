import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dock_mobile/blocs/auth/auth_bloc.dart';
import 'package:smart_dock_mobile/blocs/auth/auth_events.dart';
import 'package:smart_dock_mobile/repositories/user_repos.dart';
import 'package:smart_dock_mobile/routes.dart';
import 'package:bloc/bloc.dart';
import 'package:smart_dock_mobile/services/api.dart';
import 'package:smart_dock_mobile/data/db/db.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}


void main() async {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  await db.open();
  runApp(
    BlocProvider<AuthBloc>(
      builder: (context) {
        return AuthBloc(userRepository: UserRepository(db: db, api: api))
              ..dispatch(AppStarted());
      },
      child: Routes(),
    )
  );
} 