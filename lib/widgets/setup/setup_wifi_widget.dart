
import 'package:flutter/material.dart';
import 'package:smart_dock_mobile/data/validators/email_validator.dart';
import 'package:smart_dock_mobile/data/validators/password_validator.dart';
import 'package:smart_dock_mobile/widgets/button_icon_widget.dart';

class SetupWifiWidget extends StatefulWidget {

  final String title;
  final String description;
  final Function onCallback;

  SetupWifiWidget({Key key, 
  @required this.title, 
  @required this.description,
  this.onCallback}) : super(key: key);

  @override
  _SetupWifiWidgetState createState() => _SetupWifiWidgetState();
}

class _SetupWifiWidgetState extends State<SetupWifiWidget> {

  String _ssid, _wpa;
  bool _isShowPwd;

  @override
  void initState() {
    _isShowPwd = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'SETUP',
          style: Theme.of(context).textTheme.headline,
        ),
        elevation: 0.5,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.close,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ] 
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                widget.title,
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(
                height: 45,
              ),
              Text(
                widget.description
              ),
              SizedBox(
                height: 45,
              ),
              Form(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).accentColor),
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: TextFormField(
                            key: Key('SSID'),
                            validator: EmailFieldValidator.validate,
                            onSaved: (value) => _ssid = value,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'SSID',
                            ),
                          ),
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
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 8,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: TextFormField(
                                  key: Key('Password'),
                                  validator: PasswordFieldValidator.validate,
                                  onSaved: (value) => _wpa = value,
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
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ButtonIconWidget(
                  title: 'FINISH',
                  onPressed: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}