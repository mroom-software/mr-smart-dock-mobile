import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:smart_dock_mobile/blocs/signup/signup_bloc.dart';
import 'package:smart_dock_mobile/blocs/signup/signup_events.dart';
import 'package:smart_dock_mobile/blocs/signup/signup_states.dart';
import 'package:smart_dock_mobile/data/validators/email_validator.dart';
import 'package:smart_dock_mobile/data/validators/name_validator.dart';
import 'package:smart_dock_mobile/data/validators/password_validator.dart';
import 'package:smart_dock_mobile/widgets/common/button_widget.dart';
import 'package:smart_dock_mobile/widgets/common/combobox_widget.dart';


const String MIN_DATETIME = '1970-01-01';

class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isShowPwd = false;
  String _email, _password, _firstName, _lastName, _gender = "Male";
  String _format = 'yyyy-MMMM-dd';
  DateTime _dateTime;

  SignupBloc _signupBloc;

  @override
  void initState() {
    _dateTime = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _signupBloc = BlocProvider.of<SignupBloc>(context);

    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if(state is SignupSuccess) {
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<SignupBloc, SignupState>(
        bloc: _signupBloc,
        builder: (context, state) {
          return Scaffold(
            appBar: null,
            body: Form(
              key: formKey,
              child: Stack(
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
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 8,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Theme.of(context).accentColor),
                                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: TextFormField(
                                      key: Key('First Name'),
                                      validator: NameFieldValidator.validate,
                                      onSaved: (value) => _firstName = value,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'First Name',
                                      ),
                                    ),
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
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Theme.of(context).accentColor),
                                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: TextFormField(
                                      key: Key('Last Name'),
                                      validator: NameFieldValidator.validate,
                                      onSaved: (value) => _lastName = value,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Last Name',
                                      ),
                                    ),
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
                                  child: ComboboxWidget(
                                    lblContent: _gender,
                                    entries: ['Male', 'Female'],
                                    onChangedValue: (value) {
                                      _gender = value;
                                    },
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
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 4,
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                          child: Text(
                                            DateFormat(_format).format(_dateTime),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: InkWell(
                                            onTap: () {
                                              DatePicker.showDatePicker(
                                                context,
                                                pickerTheme: DateTimePickerTheme(
                                                  showTitle: true,
                                                  confirm: Text('Done', style: TextStyle(color: Colors.red)),
                                                  cancel: Text('Cancel', style: TextStyle(color: Colors.black87)),
                                                ),
                                                minDateTime: DateTime.parse(MIN_DATETIME),
                                                maxDateTime: DateTime.now(),
                                                initialDateTime: _dateTime,
                                                dateFormat: _format,
                                                locale: DateTimePickerLocale.en_us,
                                                onClose: () => print('close'),
                                                onCancel: () => print('cancel'),
                                                onChange: (dateTime, List<int> index) {
                                                  setState(() {
                                                    _dateTime = dateTime;
                                                  });
                                                },
                                                onConfirm: (dateTime, List<int> index) {
                                                  setState(() {
                                                    _dateTime = dateTime;
                                                  });
                                                },
                                              );
                                            },
                                            child: Icon(
                                              Icons.arrow_drop_down, 
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
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
                          (state is SignupLoading) ? 
                          CircularProgressIndicator() :
                          ButtonWidget(
                            onPressed: _btnSignupPressed, 
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
            ),
          );
        },
      ),
    );  
  }

  bool _validateAndSave() {
    final FormState form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void _btnSignupPressed() {
    if (_validateAndSave()) {
      _signupBloc.add(SignupButtonPressed(
        firstName: _firstName,
        lastName: _lastName,
        gender: _gender,
        dob: _dateTime.toString(),
        email: _email,
        password: _password,
      ));
    }
  }
}