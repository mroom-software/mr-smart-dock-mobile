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
import 'package:smart_dock_mobile/blocs/login/login_events.dart';
import 'package:smart_dock_mobile/data/models/user.dart';
import 'package:smart_dock_mobile/mocks/repos/user_repos.dart';
import 'package:smart_dock_mobile/screens/login.dart';

void main() {

  Widget makeWidgetTestable({Widget child, LoginBloc loginBloc}) {
    return MaterialApp(
      home: BlocProvider<LoginBloc>(
        builder: (context) {
          return loginBloc;
        },
        child: child,
      ),
    );
  }

  testWidgets('Login Screen', (WidgetTester tester) async {
    MockUserRepository mockUserRepository = MockUserRepository(); 
    LoginBloc _loginBloc = LoginBloc(authBloc: AuthBloc(userRepository: mockUserRepository), userRepository: mockUserRepository);

    LoginScreen screen = LoginScreen();
    await tester.pumpWidget(makeWidgetTestable(child: screen, loginBloc: _loginBloc));

    // login failed
    _loginBloc.add(LoginButtonPressed(
      email: 'trongdth@gmail.com',
      password: '123456'
    ));

    await tester.pump();
    final loginKey = Key('BtnLogin');
    expect(find.byKey(loginKey), findsOneWidget);

    // login success
    mockUserRepository.user = User(email: 'trongdth@gmail.com');
    _loginBloc.add(LoginButtonPressed(
      email: 'trongdth@gmail.com',
      password: '123456'
    ));

    await tester.pump();
    expect(find.byKey(loginKey), findsNothing);

    _loginBloc.close();
  });
}
