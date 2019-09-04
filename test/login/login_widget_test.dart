// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_dock_mobile/blocs/auth/auth_bloc.dart';
import 'package:smart_dock_mobile/blocs/login/login_bloc.dart';
import 'package:smart_dock_mobile/data/db/db.dart';
import 'package:smart_dock_mobile/mocks/repos/user_repos.dart';
import 'package:smart_dock_mobile/repositories/user_repos.dart';
import 'package:smart_dock_mobile/screens/login.dart';
import 'package:smart_dock_mobile/services/api.dart';

void main() {

  Widget makeWidgetTestable({Widget child, BaseUserRepository userRepository}) {
    return MaterialApp(
      home: BlocProvider<LoginBloc>(
        builder: (context) {
          return LoginBloc(
            authBloc: AuthBloc(userRepository: userRepository),
            userRepository: userRepository,
          );
        },
        child: child,
      ),
    );
  }

  testWidgets('Login Screen', (WidgetTester tester) async {
    MockUserRepository mockUserRepository = MockUserRepository(db: db, api: api,); 

    LoginScreen screen = LoginScreen();
    await tester.pumpWidget(makeWidgetTestable(child: screen, userRepository: mockUserRepository));
    
  });
}
