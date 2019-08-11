import 'package:flutter/material.dart';
import 'package:smart_dock_mobile/data/validators/email_validator.dart';
import 'package:smart_dock_mobile/widgets/button_widget.dart';

class ForgotPwdScreen extends StatefulWidget {
  @override
  _ForgotPwdScreenState createState() => _ForgotPwdScreenState();
}

class _ForgotPwdScreenState extends State<ForgotPwdScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String _email;

  @override
  void initState() {
    _email = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Form(
        key: formKey,
        child: Stack(
          children: <Widget>[
            Image.asset('assets/top.png'),
            Container(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Forgot your password?',
                        style: Theme.of(context).textTheme.headline,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Enter your email below to receive your password reset intructions',
                        style: Theme.of(context).textTheme.body1,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30,
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
                        height: 30,
                      ),
                      ButtonWidget(
                        onPressed: () => validateAndSave(),
                        title: 'SEND PASSWORD',
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Text(
                          'Back',
                          style: TextStyle (
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ), 
            ),
          ],
        ),
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