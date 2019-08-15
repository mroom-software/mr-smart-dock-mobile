import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dock_mobile/blocs/auth/auth_bloc.dart';
import 'package:smart_dock_mobile/blocs/auth/auth_states.dart';
import 'package:smart_dock_mobile/screens/home.dart';
import 'package:smart_dock_mobile/screens/login.dart';

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationAuthenticated) {
          return HomeScreen();
        }

        if (state is AuthenticationUnauthenticated) {
          return LoginScreen();
        }
        
        return Container();
      },
    );
  }
}