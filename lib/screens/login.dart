
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dock_mobile/blocs/auth/auth_bloc.dart';
import 'package:smart_dock_mobile/blocs/login/login_bloc.dart';
import 'package:smart_dock_mobile/blocs/login/login_events.dart';
import 'package:smart_dock_mobile/blocs/login/login_states.dart';
import 'package:smart_dock_mobile/blocs/signup/signup_bloc.dart';
import 'package:smart_dock_mobile/data/validators/email_validator.dart';
import 'package:smart_dock_mobile/data/validators/password_validator.dart';
import 'package:smart_dock_mobile/screens/forgot_pwd.dart';
import 'package:smart_dock_mobile/screens/signup.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smart_dock_mobile/widgets/common/button_icon_widget.dart';
import 'package:smart_dock_mobile/widgets/common/button_widget.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // email + password fields
  bool _isShowPwd;
  String _email, _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldstate = GlobalKey<ScaffoldState>();
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );
  LoginBloc _loginBloc;

  @override
  void initState() {
    _isShowPwd = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          _scaffoldstate.currentState.showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        bloc: _loginBloc,
        builder: (context, state) {
          if (state is LoginSuccess) {
            return Container(
              child: Center(
                child: Text(
                  'Loading'
                ),
              ),
            );
          }
          return Scaffold(
            key: _scaffoldstate,
            appBar: null,
            body: Stack(
              children: <Widget>[
                Image.asset('assets/top.png'),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Sign In',
                              style: Theme.of(context).textTheme.headline,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Theme.of(context).accentColor),
                              borderRadius: BorderRadius.all(Radius.circular(4.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: TextFormField(
                                key: Key('Email'),
                                validator: EmailFieldValidator.validate,
                                onSaved: (value) => _email = value,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Email',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Theme.of(context).accentColor),
                              borderRadius: BorderRadius.all(Radius.circular(4.0)),
                            ),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 8,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: TextFormField(
                                      key: Key('Password'),
                                      validator: PasswordFieldValidator.validate,
                                      onSaved: (value) => _password = value,
                                      obscureText: (_isShowPwd) ? false : true,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Your Password',
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: 30,
                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF5F5F5),
                                      border: Border.all(color: Color(0xFFF5F5F5)),
                                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                    ),
                                    child: Center(
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            _isShowPwd = !_isShowPwd;
                                          });
                                        },
                                        child: Text(
                                          (_isShowPwd) ? 'HIDE' : 'SHOW',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF003BFF),
                                          ),
                                        ),
                                      ), 
                                    ),
                                  ), 
                                ),
                                
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          ButtonWidget(
                            key: Key('BtnLogin'),
                            onPressed: () => _handleLogin(),
                            title: 'LOGIN',
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            child: Text(
                              '_____Or_____',
                              style: TextStyle(
                                fontSize: 13.0,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),

                          ButtonIconWidget(
                            onPressed: () => _handleGoogleSignIn(),
                            title: 'LOGIN WITH GMAIL',
                            icon: Icons.mail_outline,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: InkWell(
                                  child: Text(
                                    'FORGOT DETAIL?',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  onTap: _loadForgotPwdScreen,
                                ), 
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(),
                              ),
                              Expanded(
                                flex: 3,
                                child: Align(
                                  alignment: Alignment.centerRight, 
                                  child: InkWell(
                                    child: Text(
                                      'CREATE ACCOUNT',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    onTap: _loadSignupScreen,
                                  ),
                                ),
                              ),
                              
                            ],
                          ),
                        ],

                      ),
                    ), 
                  ),  
                ),
              ],
            ),
          );
        },
      ),
    );
    
  }

  bool _validateAndSave() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }


  void _handleLogin() {
    if(_validateAndSave()) {
      _loginBloc.add(LoginButtonPressed(
        email: _email,
        password: _password,
      ));
    }
  }

  Future<void> _handleGoogleSignIn() async {
    try {
      GoogleSignInAccount result = await _googleSignIn.signIn();
      var auth = await result.authentication;
      _loginBloc.add(
        LoginGoogleButtonPressed(
          fullName: result.displayName,
          email: result.email,
          socialID: result.id,
          socialToken: auth.accessToken,
          socialType: 0,
        )
      );
    } catch (error) {
      print(error);
    }
  }

  void _loadSignupScreen() {
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) {
        return BlocProvider<SignupBloc>(
          builder: (context) {
            return SignupBloc(
              authBloc: BlocProvider.of<AuthBloc>(context),
              userRepository: _loginBloc.userRepository,
            );
          },
          child: SignUpScreen(),
        );
      })
    );
  }

  void _loadForgotPwdScreen() {
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) {
        return BlocProvider<SignupBloc>(
          builder: (context) {
            return SignupBloc(
              authBloc: BlocProvider.of<AuthBloc>(context),
              userRepository: _loginBloc.userRepository,
            );
          },
          child: ForgotPwdScreen(),
        );
      })
    );
  }
}