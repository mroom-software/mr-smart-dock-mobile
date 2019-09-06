import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dock_mobile/blocs/auth/auth_bloc.dart';
import 'package:smart_dock_mobile/blocs/auth/auth_events.dart';
import 'package:smart_dock_mobile/widgets/common/button_widget.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _authBloc = BlocProvider.of<AuthBloc>(context);
    
    return Container(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: ButtonWidget(
          title: 'LOGOUT',
          onPressed: _handleLogout,
        ),
      ),
    );
  }

  void _handleLogout() {
    _authBloc.dispatch(LoggedOut());
  }
}