import 'package:flutter/material.dart';
import 'package:smart_dock_mobile/data/validators/email_validator.dart';
import 'package:smart_dock_mobile/data/validators/password_validator.dart';
import 'package:smart_dock_mobile/widgets/button_widget.dart';

class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isShowPwd = false;
  String _email, _password;

  @override
  void initState() {
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: <Widget>[
          Image.asset('assets/top.png'),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign Up',
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
                        key: Key('Full Name'),
                        validator: EmailFieldValidator.validate,
                        onSaved: (value) => _email = value,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Full Name',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 8,
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            border: Border.all(color: Theme.of(context).accentColor),
                            borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          ),
                          child: Text(
                            'Gender'
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            border: Border.all(color: Theme.of(context).accentColor),
                            borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          ),
                          child: Text(
                            'Gender'
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
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
                    onPressed: null, 
                    title: 'SIGN UP',
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: Theme.of(context).textTheme.display1,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign in', 
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}