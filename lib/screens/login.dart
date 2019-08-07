
import 'package:flutter/material.dart';
import 'package:smart_dock_mobile/helpers/utils.dart';
import 'package:smart_dock_mobile/widgets/button_icon_widget.dart';
import 'package:smart_dock_mobile/widgets/button_widget.dart';

class EmailFieldValidator {
  static String validate(String value) {
    if (!Utils.isValidEmail(value) || value.isEmpty) {
      return 'Email is invalid';
    }
    return null;
  }
}

class PasswordFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Password cannot be empty' : null;
  }
}

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isShowPwd;
  String _email, _password;

  @override
  void initState() {
    _isShowPwd = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: <Widget>[
          Image.asset('assets/top.png'),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
              child: Form(
                key: formKey,
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
                                    'SHOW',
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
                      onPressed: () => validateAndSave(),
                      title: 'LOGIN',
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      child: Text(
                        '_____OR_____',
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
                      onPressed: () => print('1'),
                      title: 'LOGIN WITH GMAIL',
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
                              style: Theme.of(context).textTheme.display1,
                            ),
                            onTap: () => Navigator.pushNamed(context, '/forgot_pwd'),
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
                                style: Theme.of(context).textTheme.display1,
                              ),
                              onTap: () => Navigator.pushNamed(context, '/signup'),
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
    
  }

  bool validateAndSave() {
    final FormState form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}